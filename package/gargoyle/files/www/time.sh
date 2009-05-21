#!/usr/bin/haserl
<?
	# This program is copyright � 2008,2009 Eric Bishop and is distributed under the terms of the GNU GPL 
	# version 2.0 with a special clarification/exception that permits adapting the program to 
	# configure proprietary "back end" software provided that all modifications to the web interface
	# itself remain covered by the GPL. 
	# See http://gargoyle-router.com/faq.html#qfoss for more information
	
	eval $( gargoyle_session_validator -c "$COOKIE_hash" -e "$COOKIE_exp" -a "$HTTP_USER_AGENT" -i "$REMOTE_ADDR" -r "login.sh" )
	gargoyle_header_footer -h -s "system" -p "time" -c "internal.css" -j "time.js" ntpclient system 
?>
<script>
<!--
<?
	
	echo "var timezoneLines = new Array();"
	if [ -e ./data/timezones.txt ] ; then
		cat ./data/timezones.txt | sed 's/\"/\\\"/g' | awk '{print "timezoneLines.push(\""$0"\");"}'
	fi
	echo "var timezoneData = parseTimezones(timezoneLines);"
	
	current_time=$(date "+%D %H:%M %Z")
	echo "var currentTime = \"$current_time\";"
?>
//-->
</script>


<form>
	<fieldset>
		<legend class="sectionheader">Time</legend>
	
		<div>
			<label id='current_time_label' for='timezone'>Current Date &amp; Time:&nbsp;&nbsp;&nbsp;&nbsp;</label>
			<span id="current_time"></span>
		</div>
		
		<div class="internal_divider"></div>

		<div>
			<label class='nocolumn' id='timezone_label' for='timezone'>Time Zone:</label>
		</div>
		<div class="indent">
			<div><select class='nocolumn' id='timezone' onchange="timezoneChanged()"></select></div>
		</div>
		
		<div>
			<label class='nocolumn' id='timezone_label' for='timezone'>Update Frequency:</label>
		</div>
		<div class="indent">
			<div>
				<select class='nocolumn' id='update_frequency' >
					<option value="3600">Every Hour</option>
					<option value="7200">Every 2 Hours</option>
					<option value="14400">Every 4 Hours</option>
					<option value="28800">Every 8 Hours</option>
					<option value="43200">Every 12 Hours</option>
					<option value="86400">Every 24 Hours</option>
				</select>
			</div>
		</div>


		
		<div>
			<label class='leftcolumn' id='region_label' for='region'>NTP Servers:</label>
			<div class="indent">
				<div>
					<select class='leftcolumn' id='region' onchange='updateServerList()'>
						<option value="us">United States</option>
						<option value="north-america">North America</option>
						<option value="south-america">South America</option>
						<option value="europe">Europe</option>
						<option value="africa">Africa</option>
						<option value="asia">Asia</option>
						<option value="oceania">Oceania</option>
						<option value="custom">Custom</option>
					</select>
				</div>
				<div class="indent">
					<div><input type='text' class='leftcolumn' id="server1" size="35" /></div>
					<div><input type='text' class='leftcolumn' id="server2" size="35" /></div>
					<div><input type='text' class='leftcolumn' id="server3" size="35" /></div>
				</div>
			</div>
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
	gargoyle_header_footer -f -s "system" -p "time"  
?>
