<?php //Start php part 


    if (isset($_POST['text'])) {$text = $_POST['text'];}
	
    if (!defined('T_ML_COMMENT')) {
       define('T_ML_COMMENT', T_COMMENT);
    } else {
       define('T_DOC_COMMENT', T_ML_COMMENT);
    }

   $code = "
   <?php 
     /* this is comment */
     // this is also a comment
     # me too, am also comment
     echo 'And I am some code...';
   ?>";
   
    $code = file_get_contents($text);
	//echo $code;
	//echo htmlspecialchars($code);
	$code = probel ($code);
	
	echo "<br />";
	echo $code;
	//echo htmlspecialchars($code);
    $code = strip_comments($code);
	//echo"<br>----------------------------------";
	echo htmlspecialchars($code);
	echo "<br>";
	//echo $code;
	$f = fopen('result.php',"w");
    fwrite($f,$code);
    fclose($f);
   
//------------Auixillary function-------------

function _readFromFile($file) {
   	$file_handle = fopen("test.txt", "r");
	$line = '';
    while (!feof($file_handle)) {
       $line = fgets($file_handle);
    }
    fclose($file_handle);
	return $line;
}

function strip_comments($source) {   

        $tokens = token_get_all($source);
        $ret = "";
        foreach ($tokens as $token) {
           if (is_string($token)) {
              $ret.= $token;
           } else {
              list($id, $text) = $token;

              switch ($id) { 
                 case T_COMMENT: 
                 case T_ML_COMMENT:
                 case T_DOC_COMMENT: 
                    break;

                 default:
                    $ret.= $text;
                    break;
              }
           }
        }    
        return trim(str_replace(array('',''),array(' ',''),$ret));
 }


function probel ($r)
{
	$perenos = "\r\n";
	$r = str_replace('\n',$perenos,$r);
	return $r;
}

//End php part
?>