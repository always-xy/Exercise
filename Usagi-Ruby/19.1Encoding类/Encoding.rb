# Ruby的编码与字符串

#脚本编码 决定字面量字符串对象的编码信息，与脚本的字符串编码一致。
#内部编码与外部编码 内部编码是指从外部获取的数据在程序中如何处理的信息。与之相反，外部编码是指程序向外部输出时与编码相关的信息。连这个和都与IO对象有关系。

#脚本编码与魔法注释 把指定的脚本注释称为魔法注释（magic comment)，Ruby在解释脚本前，会先读取魔法注释来决定脚本注释。
	#魔法注释必须写在首行（第1行 #！ ~开头时，则写在第2行） #encoding: utf-8
	#兼容Emacs 、 VIM 等编辑器的编码指定方式。
	#-*- coding: utf-8 -*- 		 #编辑器为Emacs的时候
	#vim:set fileencoding=utf-8: #编辑器为VIM的时候
	#enconding： EUC-JP
	a = "\u3042\u3044"
	puts a
	p a.encoding

	#encoding: EUC-JP
	# a = "u\3042\u3044"
	# a.encode!("EUC-JP")
	# p a.encoding

#可以用String#encoding方法来调查字符串的编码。String#encoding方法返回Encoding对象。

#Encoding.compatible?(str1,str2)检查两个字符串的兼容性，（兼容性：是对两个字符串是否可连接）兼容返回连接后的编码，不可兼容返回nil。
	p Encoding.compatible?("AB".encode("EUC-JP"),"あ".encode("UTF-8"))
	p Encoding.compatible?("あ".encode("EUC-JP"),"あ".encode("UTF-8"))
#Encoding.default_external 返回默认的外部编码，这个值影响IO类的外部编码。
#Encoding.default_internal 返回默认的内部编码，这个值影响IO类的内部编码。
#Encoding.find(name) 返回编码名name对应的Encoding对象。预订义的编码名由不含空格的英文字母、数字、与符号组成。查找编码的时候补分大小写。
	p Encoding.find("Shift_JIS")
	p Encoding.find("shift_jis")
=begin
				------------------------------------------
				|	locale		| 根据本地信息决定的编码		 |
				------------------------------------------
				|	external 	| 默认的外部编码 			 |
				------------------------------------------
				|	internal 	| 默认的内部编码 			 |
				------------------------------------------
				| 	filesysname | 文件系统的编码 			 |
				------------------------------------------
=end

#Encoding.list
#Encoding.name_list
#返回Ruby支持的编码一览表，list方法返回的是Encoding对象一览表，Encodin.name_list返回的什表示编码名字符一览表，两者以数组的形式返回。
	p Encoding.list
	p Encoding.name_list

#enc.name 返回Encoding对象enc的编码名。
	p Encoding.find("Shift_JIS").name

#enc.names 像EUC-JP、eucJ这样、有些编码有多个名称。这个方法会包含Encoding对象的名称一览表的数组。再次方法内的名称，都可通过该方法查询。
	enc = Encoding.find("Shift_JIS")
	p enc.names

#ASCII-8BIT是一种被用于表示二进制数据以及字节串的特殊编码。
	str = [127, 0, 0, 0].pack("c4")
	p str
	p str.encoding
	#在使用open-url库等工具通过网络获取文件时，有时候并不知道字符编码是什么，这时候编码也是默认ASCII-8BIT。
	# require 'open-uri'
	# str = open("http://www.example.jp/").read
	# p str.encoding

#正则表达式与编码，正则表达式在匹配字符串的时候也要统一编码，不然会产生错误。
	str = "模式".encode("EUC-JP")
	re = Regexp.new(str) #指定其他编码的时候使用Regexp类的new方法。
	p re.encoding
#IO类和编码 在没有明确指定编码时，IO对象外部和内部，默认使用Encoding\default_external\Encoding.default_internal。默认情况下，外部编码基于各个系统的本地信息设定，内部编码不设定。
	#IO.read(size)方法读取的字符串编码为ASCII-8BIT
#IO#set_encoding(encoding) 方法以“外部编码：内部编码”的形式指定字符串encoding。
	$stdin.set_encoding("shift_JIS:UTF-8")
	p $stdin.external_encoding
	p $stdin.internal_encoding

#File.open(file, "mode:encoding") 在打开文件时可以指定编码。