import Analysis as analize
expression = 'if (a>b) then begin end else begin begin end; end;'

def main():
    analize.parse(expression)

if __name__ == '__main__':
    main()