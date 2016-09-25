#!/usr/bin/python
# Really simply hex transcoder
import sys

usage="hex.py -e|-encode|-d|-decode 'TEXT TO TRANSCODE'"

def main():
	try: ed=sys.argv[1]
	except: print(usage);exit(1)
	try: text=sys.argv[2]
	except: 
		try: text=raw_input()
		except: print(usage);exit(1)
	try:
		if ed in "-e -encode".split(' '):
			print(text.encode('hex'))
		elif ed in "-d -decode".split(' '):
			print(text.decode('hex'))
		else:
			exit(1)
	except: print(usage);exit(1)

if __name__=="__main__":
	main()
