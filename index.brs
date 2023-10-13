' Your Roku app code in BrightScript

' Initialize the application
function Main() as Void
    ' Create a video node
    video = CreateObject("roVideoPlayer")

    ' Set the content URL to your video file
    videoContent = CreateObject("roAssociativeArray")
    videoContent.url = "http://your-server.com/YOURVIDEO.mp4" ' Replace with your actual video URL

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
End Function
