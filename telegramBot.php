<?php
function get_weather()
{
// PARAMETRI DA MODIFICARE
$TOKEN = 'xenoncursedavitindiesyb';
// NON APPORTARE MODIFICHE NEL CODICE SEGUENTE
$API_URL = 'https://warm-earth-14163.herokuapp.com/';
$method = 'meteo';
$parameters = array('key'=>$TOKEN);
$url = $API_URL . $method. '?' . http_build_query($parameters);
$handle = curl_init($url);
curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
curl_setopt($handle, CURLOPT_CONNECTTIMEOUT, 5);
curl_setopt($handle, CURLOPT_TIMEOUT, 60);
$result = curl_exec($handle);
$result= json_decode($result,true);
return $result['text'];
}
// recupero il contenuto inviato da Telegram
$content = file_get_contents("php://input");
// converto il contenuto da JSON ad array PHP
$update = json_decode($content, true);
// se la richiesta è null interrompo lo script
if(!$update)
{
  exit;
}
// assegno alle seguenti variabili il contenuto ricevuto da Telegram
$message = isset($update['message']) ? $update['message'] : "";
$messageId = isset($message['message_id']) ? $message['message_id'] : "";
$chatId = isset($message['chat']['id']) ? $message['chat']['id'] : "";
$firstname = isset($message['chat']['first_name']) ? $message['chat']['first_name'] : "";
$lastname = isset($message['chat']['last_name']) ? $message['chat']['last_name'] : "";
$username = isset($message['chat']['username']) ? $message['chat']['username'] : "";
$date = isset($message['date']) ? $message['date'] : "";
$text = isset($message['text']) ? $message['text'] : "";
// pulisco il messaggio ricevuto togliendo eventuali spazi prima e dopo il testo
$text = trim($text);
// converto tutti i caratteri alfanumerici del messaggio in minuscolo
$text = strtolower($text);
// mi preparo a restitutire al chiamante la mia risposta che è un oggetto JSON
// imposto l'header della risposta
$answers=array($firstname." hai un bel nome!","Perché mi hai scritto: ".$text."?","Sei per caso un friggiuova?",$firstname.", grazie di avermi scritto:-)","Ti voglio bene!","I Love Open Source",$text." davvero?:)","Mi piace scrivere messaggi!","Mi dici le leggi di Keplero?", "Conosci una chiavetta USB?", "Sai che ho tanti ADC?","Voglio un muffin al silicio!");
$reply_text=$answers[rand(0,11)];
switch($text){
case '/stato':
	$reply_text='Stato: carino e coccoloso';
	break;
case '/meteo':
     $reply_text=get_weather();
     break;
case '/start':
     $reply_text='Bene, iniziamo a chattare!';
     break;
case '/help':
     $reply_text='Hey, puoi chiedermi cose come il /meteo, il mio /stato, /boltzmann oppure scrivermi cose a caso!';
     break;
case '/boltzmann':
     $reply_text='S=klnΩ';
     break;
}
header("Content-Type: application/json");
// la mia risposta è un array JSON composto da chat_id, text, method
// chat_id mi consente di rispondere allo specifico utente che ha scritto al bot
// text è il testo della risposta
$parameters = array('chat_id' => $chatId, "text" => $reply_text, 'reply_to_message_id' => $messageId);
// method è il metodo per l'invio di un messaggio (cfr. API di Telegram)
$parameters["method"] = "sendMessage";
// converto e stampo l'array JSON sulla response
echo json_encode($parameters);

?>
