from flask import request
from tools import tools
import sys, StringIO

@tools.route("/python")
def python():
	if "run" in request.args.keys():
		src=request.args["run"]
		tmp=sys.stdout
		sys.stdout=StringIO.StringIO()
		try:
			exec(src)
		except Exception,e:
			return e.__repr__()
		ans=sys.stdout.getvalue()
		sys.stdout.close()
		sys.stdout=tmp
		return ans
	else:
		return ""	