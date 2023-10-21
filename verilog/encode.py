import wave

with open("build/music.pcm", "rb") as f:
    frag = f.read()

with wave.open("build/music.wav", mode="wb") as f:
    f.setnchannels(1)
    f.setsampwidth(1)
    f.setframerate(44100)
    f.writeframes(frag)
