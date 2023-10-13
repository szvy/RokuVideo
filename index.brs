' Initialize the application
function Main() as Void
    ' Create a video node
    video = CreateObject("roVideoPlayer")

    while true
        ' Set the content URL to your video file
        videoContent = CreateObject("roAssociativeArray")
        videoContent.url = "https://github.com/szvy/RokuVideo/raw/main/Example%20Video.mp4" ' Replace with your video URL

        ' Play the video
        video.PlayContent(videoContent)

        ' Wait for video playback to finish
        while true
            msg = wait(0, video.GetMessagePort())
            if type(msg) = "roVideoPlayerEvent"
                if msg.isFullResult()
                    if msg.getResult() = "END" ' Video has ended
                        exit while
                    end if
                end if
            end if
        end while
        
        ' Pause for a moment before replaying the video (adjust as needed)
        sleep(100) ' Sleep for 0.1 seconds (100 milliseconds)
    end while
End Function
