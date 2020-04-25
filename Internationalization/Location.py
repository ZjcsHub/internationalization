import os

fileName = input("输入文件路径：")
isExist = os.path.exists(fileName)
if isExist == True:
    print("文件存在")
    outPutString = ""
    with open(fileName,"r") as f:
        lines = f.readlines()
        # print(lines)

        for line in lines:
            # 去除尾部的换行符
            line = line.rstrip("\n")
            # 去除分号
            line = line.replace(";","")
            # 按等号 分割成两个数组

            numberList = line.split("=")
            if len(numberList) != 2:
                continue
            # 得到数组后去除首尾的引号
            key = numberList[0].strip().strip("\"").strip("'")
            value = numberList[1].strip().strip("\"").strip("'")
            value = value.replace('\\N','\\n') #将大写的转换成小写
            value = value.replace("\"","\\\"")
            value = value.replace("</string>", "")
            value = value.replace("<string>", "")
            # 如果value值中间存在\n 或者存在" 就加转换符
            print("%s , %s \n" %(key,value))
            #输出文件
            outPutString += "\"%s\" = \"%s\";\n" %(key,value)

        f.close()
        print(outPutString)
