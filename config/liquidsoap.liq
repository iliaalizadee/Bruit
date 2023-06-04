list = playlist("/path/to/playlist/")
mic = input.harbor("mic", port=8080, password="passwd", buffer=1.0)
radio = smooth_add(normal=list, special=mic)
meta = ref([])

def empty(_) =
    ""
end



def apply_meta(m) =
    str = m["filename"]
    str = string.replace(pattern="/path/to/playlist/", empty, str)
    str = string.replace(pattern=".mp3", empty, str)
    meta := [m["title"], m["artist"], str]
    m
end

radio = metadata.map(apply_meta,radio)


def get_meta(_, response) =
    response.header("Access-Control-Allow-Origin","*")
    response.json(!meta)
end

harbor.http.register(port=7000,method="GET","/metadata",get_meta)
output.icecast(%fdkaac(channels=2, samplerate=44100, bandwidth="auto", bitrate=96, afterburner=false, aot="mpeg4_he_aac_v2", transmux="adts", sbr_mode=false), host="localhost", port=8000, password="passwd", mount="stream.aac", radio)