import os,sys
from io import BytesIO
from mutagen.mp3 import MP3
from mutagen.id3 import ID3
from PIL import Image

for file in os.listdir("music"):
    song_path = "./music/" + file
    tags = ID3(song_path)
    try:
        pict = tags.get("APIC:").data
        Image.open(BytesIO(pict)).save("./covers/" + file[:8] + ".webp")
    except:
        print(file + "no cover")