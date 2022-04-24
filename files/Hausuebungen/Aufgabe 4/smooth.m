stadt = Import["stadt.jpg"];
stadt = ColorConvert[stadt,"Grayscale"];
pixelwerte = ImageData[stadt,"Byte"];

stadt3x3 = OpenWrite["stadt3x3.pgm"];
stadt5x5 = OpenWrite["stadt5x5.pgm"];
stadt7x7 = OpenWrite["stadt7x7.pgm"];

WriteString[stadt3x3,"P2 \n",Last[Dimensions[pixelwerte]]," ", First[Dimensions[pixelwerte]],"\n255\n"];
WriteString[stadt5x5,"P2 \n",Last[Dimensions[pixelwerte]]," ", First[Dimensions[pixelwerte]],"\n255\n"];
WriteString[stadt7x7,"P2 \n",Last[Dimensions[pixelwerte]]," ", First[Dimensions[pixelwerte]],"\n255\n"];


For[i=1, i<= First[Dimensions[pixelwerte]],i++, 
	For[j=1, j<=Last[Dimensions[pixelwerte]],j++,
		If [i >= 1 && j >= 1 && i+2 <= First[Dimensions[pixelwerte]] && j+2 <= Last[Dimensions[pixelwerte]],
			WriteString[stadt3x3,Round[Total[Total[Take[pixelwerte,{i,i+2},{j,j+2}]]]/9]," "]
		,
			WriteString[stadt3x3,Round[Total[Total[Take[pixelwerte,{i},{j}]]]]," "];

		]
	]
]
Close[stadt3x3];

For[i=1, i<= First[Dimensions[pixelwerte]],i++, 
	For[j=1, j<=Last[Dimensions[pixelwerte]],j++,
		If [i >= 1 && j >= 1 && i+4 <= First[Dimensions[pixelwerte]] && j+4 <= Last[Dimensions[pixelwerte]],
			WriteString[stadt5x5,Round[Total[Total[Take[pixelwerte,{i,i+4},{j,j+4}]]]/25]," "]
		,
			WriteString[stadt5x5,Round[Total[Total[Take[pixelwerte,{i},{j}]]]]," "];

		]
	]
]
Close[stadt5x5];

For[i=1, i<= First[Dimensions[pixelwerte]],i++, 
	For[j=1, j<=Last[Dimensions[pixelwerte]],j++,
		If [i >= 1 && j >= 1 && i+6 <= First[Dimensions[pixelwerte]] && j+6 <= Last[Dimensions[pixelwerte]],
			WriteString[stadt7x7,Round[Total[Total[Take[pixelwerte,{i,i+6},{j,j+6}]]]/49]," "]
		,
			WriteString[stadt7x7,Round[Total[Total[Take[pixelwerte,{i},{j}]]]]," "];

		]
	]
]
Close[stadt7x7];