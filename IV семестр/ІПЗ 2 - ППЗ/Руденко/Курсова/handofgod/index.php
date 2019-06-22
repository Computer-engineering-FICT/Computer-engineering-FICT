<?php defined( '_JEXEC' ) or die; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ru-ru" lang="ru-ru" dir="ltr">
<head>
<jdoc:include type="head" />
<link rel="stylesheet" href="/templates/system/css/system.css" type="text/css" />
<link rel="stylesheet" href="/templates/system/css/general.css" type="text/css" />
<link rel="stylesheet" href="/templates/<?php echo $this->template; ?>/style.css" type="text/css" />
<link rel="stylesheet" href="/templates/<?php echo $this->template; ?>/style_ddmenu.css" type="text/css" />
<link rel="stylesheet" href="/templates/<?php echo $this->template; ?>/style_profile.css" type="text/css" />
<link rel="stylesheet" href="/templates/<?php echo $this->template; ?>/style_user_acc.css" type="text/css" />
<link rel="stylesheet" href="/templates/<?php echo $this->template; ?>/style_create_acc.css" type="text/css" />
<link rel="stylesheet" href="/templates/<?php echo $this->template; ?>/style_acc_sett.css" type="text/css" />
<link rel="stylesheet" href="/templates/<?php echo $this->template; ?>/style_Mess.css" type="text/css" />
<link rel="stylesheet" href="/templates/<?php echo $this->template; ?>/style_NewM.css" type="text/css" />
<link rel="stylesheet" href="/templates/<?php echo $this->template; ?>/style_AppS.css" type="text/css" />
</head>
<div id="layout">
    <div id="header">
         <a href="http://localhost/"><p id="logo"><b>hand of god</b></p></a>
         <jdoc:include type="modules" name="top-menu" style="xhtml"/>
    </div>

    <div id="content">		
		<jdoc:include type="modules" name="content" style="xhtml" />
		<jdoc:include type="message" />
		<jdoc:include type="component" />     
    </div>

    <div class="clear"></div>

    <div id="footer">
        <jdoc:include type="modules" name="footer" style="xhtml" />
    </div>
</div>
</html>
