from tkinter import *
root = Tk()
text = Text(root, height=10, width=60)
text.pack(side='left')
scrollbar = Scrollbar(root)
scrollbar.pack(side='left')
# перша прив’язка
scrollbar['command'] = text.yview
# друга прив’язка
text['yscrollcommand'] = scrollbar.set
root.mainloop()
