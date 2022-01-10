Function Invoke-TeamsMSG {
	param( [string[]]$To, [string]$Message ) 
	$To = [system.web.httputility]::URLENCODE($To -join ',')
	$Message = [system.web.httputility]::URLENCODE($Message)
	$Command = "/l/chat/0/0?users=$To&message=$Message"
	$Null = start-process msteams:$Command 
}
Function Invoke-TeamsCall {
	param ( [string[]]$To )
	$To = [system.web.httputility]::URLENCODE($To -join ',')
	$Command = "/l/call/0/0?users=$To"
	$Null = start-process msteams:$Command
}
Function Invoke-TeamsScheduleMeeting {
	param([string[]]$To,[string]$subject)
	$Subject = [system.web.httputility]::URLENCODE($Subject)
	$Attendees = [system.web.httputility]::URLENCODE($To -join ',')
	$Command = "/l/meeting/new?subject=$Subject&attendees=$Attendees"
	$Null = start-process msteams:$Command
}
