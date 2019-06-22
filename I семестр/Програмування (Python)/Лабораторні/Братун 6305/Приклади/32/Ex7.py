import tkinter
import time
curtime = ''
clock = tkinter.Label(font = "Arial 20")
clock.pack()
def tick():
    global curtime
    newtime = time.strftime('%b %d %Y -- %H:%M:%S')
    if newtime != curtime:
        curtime = newtime
        clock.config(text=curtime)
    clock.after(200, tick)

tick()
clock.mainloop()
