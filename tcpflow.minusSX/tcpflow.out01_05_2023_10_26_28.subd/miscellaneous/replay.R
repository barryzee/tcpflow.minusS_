source('/Users/barryzeeberg/personal/hearts/hearts_card_game_bayesian_inference/programs/hearts.bridge.tts.R', chdir = TRUE)
replay<-
	function(mov,hand1,hand2,manualUpdateProbs,TTS_ALL,TTS_BASIC,SLEEP) {
		syst=sprintf("open %s", mov)
		system(syst)

		syst=sprintf("osascript \'%s/openAndResizeQuicktime.scpt\' %s", "/Users/barryzeeberg/personal/hearts/hearts_card_game_bayesian_inference/programs", mov)
		system(syst)

		for(hand in hand1:hand2) {
			output.dir=playWholeHandDriverPassParams(manualUpdateProbs=manualUpdateProbs,dir="/Volumes/Lacie_mini_2TB/tcpflow.minusS_//tcpflow.out01_05_2023_10_26_28.subd/processed__01_05_2023_10_41_47.subdir",hand=hand,game="hearts",suit.trump="",leader.firstTrick=0,pass.direction="l",TTS_ALL=TTS_ALL,TTS_BASIC=TTS_BASIC,SLEEP=SLEEP)


			if(typeof(output.dir)!="character") {
				print("WARNING IN REPLAY.R")
				print(c("HAND: ",hand))
				print("UNABLE TO INVERT PROBS MATRIX")
				print("SKIPPING THIS HAND, AND MOVING ON TO THE NEXT HAND")
				tts("WARNING IN REPLAY.R")
				tts(c("HAND: ",hand))
				tts("UNABLE TO INVERT PROBS MATRIX")
				tts("SKIPPING THIS HAND, AND MOVING ON TO THE NEXT HAND")
				next
			}
		}


		syst=sprintf("%s/moveScreenRecording.sh \'%s/annotations\' \'%s\' \'%s\' \'%s\' \'%s\'",'/Users/barryzeeberg/personal/hearts/hearts_card_game_bayesian_inference/programs', output.dir, '/Volumes/Lacie_mini_2TB/tcpflow.minusS_/', hand1, hand2, manualUpdateProbs)
		print(syst)
		system(syst)
	}

replay(mov="/Volumes/Lacie_mini_2TB/tcpflow.minusS_//tcpflow.out01_05_2023_10_26_28.subd/miscellaneous/Screen_Recording_2023-01-05_at_10.26.30.mov",hand1=1,hand2=11,manualUpdateProbs=TRUE,TTS_ALL=FALSE,TTS_BASIC=FALSE,SLEEP=0)
