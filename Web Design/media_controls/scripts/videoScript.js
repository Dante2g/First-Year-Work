document.addEventListener( "DOMContentLoaded", initialiseWebPage ) ; 

function initialiseWebPage() {
    //Defines function 'initialiseWebPage'.
    const myVideo = document.querySelector( "video" ) ; //Query/Search to return first element that matches 'video' within the HTML doc.
    const playButton = document.getElementById( "playPause" ) ; //Query/Search to return anything with ID 'playPause'.
    const muteButton = document.getElementById( "muteUnmute" ) ; 
    const scrubSlider = document.getElementById( "seekBar" ) ; 
    const volumeSlider = document.getElementById( "volumeBar" ) ; 
    const forwardStep = document.getElementById( "forwardStep" ) ; 
    const backwardStep = document.getElementById( "backwardStep" ) ; 
    const videoSpeed = document.getElementById( "playBackSpeed" ) ;
	const currentTimeDisplay = document.getElementById( "currentTime" ) ;
	const currentVolumeDisplay = document.getElementById( "currentVolume" ) ;
    const hidden = "hidden" ; //Used for pausing video when tabbed out.
    const visibilityChange = "visibilitychange" ; //Used for pausing video when tabbed out.
	let prevPaused = true ; //variable used for checking if video has been prevously paused when switching tabs
    document.getElementById( "playBackSpeed" ).selectedIndex = 4 ; //Sets default (selected) playback speed to 1.
    volumeSlider.value = 50 ; //Sets default volume slider value upon initialisation.
    myVideo.volume = 0.5 ; //Sets default volume value upon initialisation.
	currentTimeDisplay.value = "0:00" ; //Sets intial time on display.
	currentVolumeDisplay.value = "5" ;//Sets intial volume on display.	
    playButton.addEventListener( "click", playPauseVideo ) ; //Listens for playButton being clicked, if so it runs function playPauseVideo.
    muteButton.addEventListener( "click", muteUnmuteVideo ) ; //Listens for muteButton being clicked, if so it runs function muteUnmuteVideo.
    scrubSlider.addEventListener( "input", scrubVideo ) ; //Listens for a change in the scrubSlider and then runs function "scrubVideo".
    myVideo.addEventListener( "timeupdate", movePlaySlider ) ; //When video plays/updates movePlaySlider function will run.
    myVideo.addEventListener( "timeupdate", updateTime ) ; //When video plays/updates updateTime function will run.
    volumeSlider.addEventListener( "input", controlVolume ) ; //Listens for a change in the volumeSlider and then runs function "controlVolume".
    forwardStep.addEventListener( "click", stepVideoForward ) ; 
    backwardStep.addEventListener( "click", stepVideoBackward ) ; 
    backwardStep.addEventListener( "dblclick", resetVideo ) ; //Listens for backwardStep being double clicked, if so it runs function "resetStepVideo".
    videoSpeed.addEventListener( "change", changeSpeed ) ; //listens for select option to change, runs change speed function.
    document.addEventListener( visibilityChange, pauseHiddenVideo ) ; //Calls function pauseHiddenVideo when visibility changes.
    document.addEventListener( 'keydown',  runShortcuts) ; //Calls event function when a key is pressed.
     
    
    function runShortcuts( event ) {
        if ( event.keyCode === 38 ) { //if a certain key is pressed (each has an individual keycode in this case 40 is for the up arrow) then the corrosponding function will be ran.
            increaseVolumeTen() ;
        } else if ( event.keyCode === 40 ) {
             decreaseVolumeTen() ;
        } else if ( event.keyCode === 37 ) {
            stepVideoBackward() ;
        } else if ( event.keyCode === 39 ) {
            stepVideoForward() ;
        } else if ( event.keyCode === 77 ) {
            muteUnmuteVideo() ;
        } else if ( event.keyCode === 32 ) {
            playPauseVideo() ;
        } 
    }
    
    
    function increaseVolumeTen() {
        myVideo.volume = myVideo.volume + 0.1 ; //Increases volume of video by 0.1, which is 10%.
        volumeSlider.value = ( myVideo.volume * 100 ) ; //Volume is multiplied by 100 so that the volume slider can match the volume level, it is then updated.
        controlVolume() ;
    }   
    
    
    function decreaseVolumeTen() {
        myVideo.volume = myVideo.volume - 0.1 ; //Decreases volume of video by 0.1, which is 10%.
        volumeSlider.value = ( myVideo.volume * 100 ) ; //Volume is multiplied by 100 so that the volume slider can match the volume level, it is then updated.
        controlVolume() ;
    }  
    

    function playPauseVideo() {
        if ( myVideo.paused === true ) {
			//If statement using my video.paused as a bool to determine condition.
            myVideo.play() ; //Plays video.
            playButton.innerHTML = "&#10074;&#10074;" ; //Changes playButton element to "&#10074;&#10074;" pause symbol so that the symbol is not mismatched to the current state of the video.
        } else {
            myVideo.pause() ; //Pauses video.
            playButton.innerHTML = "&#9658;" ; //Changes playButton element to "&#9658;" play symbol so that the symbol is not mismatched to the current state of the video.
        }
    } //Closes playPauseVideo function.


    function muteUnmuteVideo() {
        if ( myVideo.muted === false ) {
			//If statement using my video.muted as a bool to determine condition.
            myVideo.muted = true ; //Mutes video.
            muteButton.innerHTML = "&#128263;" ; //Changes muteButton element to speaker symbol so that the symbol is not mismatched to the current audio of the video.
            volumeSlider.value = 0 ; //Sets volume bar to 0;
            currentVolumeDisplay.value = "0" ;
        } else {
            myVideo.muted = false ; //Pauses video.
            muteButton.innerHTML = "&#128266;" ; //Changes muteButton element to speaker symbol so that the symbol is not mismatched to the current audio of the video.
            volumeSlider.value = 50 ; //Sets volume bar to default value
            myVideo.volume = 0.5 ;
            currentVolumeDisplay.value = "5" ;
        }
    } //Closes muteUnmuteVideo function.


    function scrubVideo() {
        let scrubTime = myVideo.duration * ( scrubSlider.value / 100 ) ; //gets current value of slider control and changes it into percentage.
        myVideo.currentTime = scrubTime ; //Sets video time to match percentage on the slider control.
    } //Closes scrubVideo function.


    function movePlaySlider() {
        scrubSlider.value = ( myVideo.currentTime / myVideo.duration ) * 100 ; //Changes current position of slider to match current time of video when video is playing.
    } //Closes movePlaySlider function.


    function updateTime() {
		let minutes = Math.trunc( myVideo.currentTime / 60 ) ; //Divides total seconds by 60 to get minutes.
		let seconds = Math.trunc( myVideo.currentTime % 60 ) ;//Uses mod to get seconds from total seconds.
        if ( seconds < 10 ) {
            currentTimeDisplay.value = minutes + ":0" + seconds ;
            //Check if current time is less than 10 seconds if it is a 0 will be added before the second counter so that it is formatted in the correct way.
        } else {
            currentTimeDisplay.value = minutes + ":" + seconds ;
			//Else if time is more than 10 seconds no 0 will be added, again this is done so the formatting is correct.
        }
        //Sets the timer to the correct time in minutes and seconds using /60 and %'mod'60 to seperate the minutes and seconds, then eventually reconstruct them in the correct format.
    } //Closes update time


    function changeSpeed() {
        myVideo.playbackRate = ( document.getElementById( "playBackSpeed" ).value ) ;
        //Changes speed of video to the value of the selected option from dropdown, I have done it this way to avoid a massive if statement or many lines of code, instead all the integers needed are stored as values in the html.
    }


    function controlVolume() {
        let volumeLevel = ( volumeSlider.value / 100 ) ; //Gets volume slider value, divides by 100 to match the volumeLevel to the position of the silder.
        myVideo.volume = volumeLevel ; //Changes volume of video depending on volume slider position.
        currentVolumeDisplay.value = Math.round( myVideo.volume * 10 ) ; //Sets value of 'currentVolume' so the current volume is displayed /10.
        if ( volumeLevel === 0 ) //Checks if volume level is 0.
        {
            myVideo.muted = true ; //Mutes video.
            muteButton.innerHTML = "&#128263;" ; //Changes muteButton element to speaker symbol so there is no mismatch.
        } else {
            myVideo.muted = false ; //Pauses video.
            muteButton.innerHTML = "&#128266;" ; //Changes muteButton element to speaker symbol so there is no mismatch.
        }
    } //Closes control volume function


    function stepVideoForward() {
        myVideo.currentTime = ( myVideo.currentTime + 10 ) ; //Adds 10 seconds to current time.
    }//Closes stepVideoForward function


    function stepVideoBackward() {
        myVideo.currentTime = ( myVideo.currentTime - 30 ) ; //Removes 30 seconds from current time.
    }//Closes stepVideoBackward function


    function resetVideo() {
		myVideo.load() ; //Reloads video so poster will be displayed and time set to 0.
		playButton.innerHTML = "&#9658;" ; //Changes to play button symbol so there is no mismatch.
    }//Closes resetVideo function
    
   
    function pauseHiddenVideo() {
		if (( document.hidden === true )&&( myVideo.paused === true )){ //Checks document is hidden and checks if video is paused.
		prevPaused = true ; //sets the previously paused varible to true, this is so that if the vid was already paused before the tab switches that it dosent play when you switch back.
		}
		if (( document.hidden === true )&&( myVideo.paused === false )){//Checks to see if document is hidden and checks if video is unpaused.
		prevPaused = false ;
		myVideo.pause() ; //Pauses video.
		}
		if (( document.hidden === false )&&( prevPaused === false )){ //Check if document is unhidden and hasnt been paused previously.
		myVideo.play() ; //Plays video.
		prevPaused = false ; //Resets prevPaused varible as the video is set to play above.
		}		
    }//Closes pauseHiddenVideo function
} //Closes "initialiseWebPage" function.
