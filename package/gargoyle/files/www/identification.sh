#!/usr/bin/haserl
<?
	# This program is copyright � 2008 Eric Bishop and is distributed under the terms of the GNU GPL 
	# version 2.0 with a special clarification/exception that permits adapting the program to 
	# configure proprietary "back end" software provided that all modifications to the web interface
	# itself remain covered by the GPL. 
	# See http://gargoyle-router.com/faq.html#qfoss for more information
	
	eval $( gargoyle_session_validator -c "$COOKIE_hash" -e "$COOKIE_exp" -a "$HTTP_USER_AGENT" -i "$REMOTE_ADDR" -r "login.sh" )
	gargoyle_header_footer -h -s "system" -p "ident" -c "internal.css" -j "identification.js" system dhcp network wireless
?>





<form>
	<fieldset>
		<legend class="sectionheader">Identification</legend>
		<div>
			<label class='narrowleftcolumn' for='hostname' id='hostname_label'>Hostname:</label>
			<input type='text' class='rightcolumn' onkeyup='proofreadLengthRange(this,1,999)' id='hostname' size='35' maxlength='25' />
		</div>
		<div id="domain_container">
			<label class='narrowleftcolumn' for='domain' id='domain_label'>Domain:</label>
			<input type='text' class='rightcolumn' onkeyup='proofreadLengthRange(this,1,999)' id='domain' size='35' maxlength='100' />
		</div>
	
	</fieldset>
	<div id="bottom_button_container">
		<input type='button' value='Save Changes' id="save_button" class="bottom_button" onclick='saveChanges()' />
		<input type='button' value='Reset' id="reset_button" class="bottom_button" onclick='resetData()'/>
	</div>
	<span id="update_container" >Please wait while new settings are applied. . .</span>
</form>

<!-- <br /><textarea style="margin-left:20px;" rows=30 cols=60 id='output'></textarea> -->


<script>
<!--
	resetData();
//-->
</script>


<?
	gargoyle_header_footer -f -s "system" -p "ident"
?>
