{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 1,
			"revision" : 2,
			"architecture" : "x64",
			"modernui" : 1
		}
,
		"classnamespace" : "box",
		"rect" : [ 121.0, 97.0, 1219.0, 808.0 ],
		"bglocked" : 0,
		"openinpresentation" : 1,
		"default_fontsize" : 11.0,
		"default_fontface" : 0,
		"default_fontname" : "Lucida Sans Typewriter ",
		"gridonopen" : 1,
		"gridsize" : [ 15.0, 15.0 ],
		"gridsnaponopen" : 1,
		"objectsnaponopen" : 1,
		"statusbarvisible" : 2,
		"toolbarvisible" : 1,
		"lefttoolbarpinned" : 0,
		"toptoolbarpinned" : 0,
		"righttoolbarpinned" : 0,
		"bottomtoolbarpinned" : 0,
		"toolbars_unpinned_last_save" : 0,
		"tallnewobj" : 0,
		"boxanimatetime" : 200,
		"enablehscroll" : 1,
		"enablevscroll" : 1,
		"devicewidth" : 0.0,
		"description" : "",
		"digest" : "",
		"tags" : "",
		"style" : "tatarism",
		"subpatcher_template" : "",
		"boxes" : [ 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-238",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 328.782978653907776, 1394.642554998397827, 148.0, 21.0 ],
					"text" : "expr $f2*10000. / $f1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-237",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 763.814893364906311, 362.537601755092624, 29.5, 21.0 ],
					"text" : "f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-235",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 824.468079209327698, 903.191482901573181, 29.5, 21.0 ],
					"text" : "f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-220",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "float", "int" ],
					"patching_rect" : [ 742.800006413459755, 1079.600019812583923, 55.0, 21.0 ],
					"text" : "t 1 f 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-216",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 660.923942089080811, 1224.993630812595256, 62.0, 21.0 ],
					"text" : "gate 1 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-215",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 397.782978653907776, 1553.10002863407135, 128.0, 21.0 ],
					"text" : "r #0-audio-2-start"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-171",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 614.546784452998963, 1282.312076330184937, 128.0, 21.0 ],
					"text" : "s #0-audio-2-start"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-159",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 624.778723502159096, 695.437603221366885, 62.0, 21.0 ],
					"text" : "gate 1 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-154",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "float", "int" ],
					"patching_rect" : [ 684.799999976158119, 532.978719592094421, 55.0, 21.0 ],
					"text" : "t 1 f 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-145",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 328.782978653907776, 1329.574468016624451, 121.0, 21.0 ],
					"text" : "r #0-max-duration"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-143",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 164.02500194311142, 1170.212757587432861, 121.0, 21.0 ],
					"text" : "s #0-max-duration"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-140",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "float", "float", "float" ],
					"patching_rect" : [ 328.782978653907776, 1357.174473881721497, 55.0, 21.0 ],
					"text" : "t f f f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-119",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 704.299994766712075, 1515.876596570014954, 88.0, 21.0 ],
					"text" : "sprintf %.2f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-108",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1495.0, 1575.600017726421356, 62.0, 21.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-107",
					"linecount" : 6,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 178.216324299573898, 2441.776594877243042, 219.399999976158142, 84.0 ],
					"presentation" : 1,
					"presentation_linecount" : 4,
					"presentation_rect" : [ 3.972910090488426, 614.449789712252709, 570.399999976158142, 58.0 ],
					"text" : "Second sound is set to: \n 481209__erokia__msfxp2-415 \n at the path \n D:\\my_workspace\\dataset\\erokia\\audio\\481209__erokia__msfxp2-415.wav"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-24",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 411.716324299573898, 2391.876600682735443, 81.0, 21.0 ],
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"dontreplace" : 1,
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-13",
					"linecount" : 3,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 522.682972848415375, 2207.376600682735443, 207.0, 47.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 290.0, 272.347028863636297, 265.710419716035858, 34.0 ],
					"text" : "D:/my_workspace/dataset/erokia/func-timbre-vae-cedar/run-013/"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-294",
					"maxclass" : "button",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 47.0, 491.0, 24.0, 24.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-281",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "float" ],
					"patching_rect" : [ 885.692559361457825, 857.808511793613434, 55.0, 21.0 ],
					"text" : "t b b f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-282",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 874.942559361457825, 904.637607024143222, 35.0, 21.0 ],
					"text" : "- 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-283",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 741.842552924156166, 857.808511793613434, 141.0, 21.0 ],
					"text" : "r #0-audio2-duration"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-280",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "float" ],
					"patching_rect" : [ 836.314893364906311, 316.833362936973572, 55.0, 21.0 ],
					"text" : "t b b f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-279",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 814.564893364906311, 355.333362936973572, 35.0, 21.0 ],
					"text" : "- 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-276",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 814.564893364906311, 289.157783508300781, 141.0, 21.0 ],
					"text" : "r #0-audio1-duration"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-271",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 279.399999976158142, 1060.329086496402851, 141.0, 21.0 ],
					"text" : "s #0-audio2-duration"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-250",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 326.282978653907776, 2145.876600682735443, 150.0, 19.0 ],
					"text" : "Not needed anymore"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-160",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 742.000012413459785, 1868.443299174308777, 168.0, 34.0 ],
					"text" : "set Duration: 0. Select audio files to start"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-157",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 575.299994766712075, 1666.209930956363678, 234.0, 21.0 ],
					"text" : "append Select audio files to start"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-156",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 575.299994766712075, 1698.176620543003082, 148.0, 21.0 ],
					"text" : "prepend set Duration:"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-144",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 575.299994766712075, 1634.276594877243042, 88.0, 21.0 ],
					"text" : "routepass 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-87",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 177.02500194311142, 1454.058174339870675, 42.0, 21.0 ],
					"text" : "t i i"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 14.0,
					"id" : "obj-15",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1096.149999260902405, 1744.33335280418396, 119.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1152.906249284744263, 351.256740014567981, 69.0, 23.0 ],
					"text" : "Output"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-291",
					"maxclass" : "number",
					"maximum" : 64,
					"minimum" : 0,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 457.782978653907776, 1895.276594877243042, 50.0, 21.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "number",
							"parameter_initial_enable" : 1,
							"parameter_mmax" : 64.0,
							"parameter_initial" : [ 1 ],
							"parameter_shortname" : "number",
							"parameter_type" : 1
						}

					}
,
					"varname" : "number"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-288",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 457.782978653907776, 1929.743311405181885, 201.0, 21.0 ],
					"text" : "prepend /sound/set_phase_iter"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-289",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 457.782978653907776, 1965.743284046649933, 108.0, 21.0 ],
					"text" : "send #0-udpsend"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-278",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 230.899999976158142, 804.0, 42.0, 21.0 ],
					"text" : "t b b"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 11.0,
					"id" : "obj-277",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 230.899999976158142, 769.666704297065735, 149.0, 34.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 317.344802141982086, 384.256740014567981, 207.0, 21.0 ],
					"text" : "set previous audio files again"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-274",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 183.282978653907776, 1723.876623511314392, 55.0, 21.0 ],
					"text" : "del 500"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-273",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 206.282978653907776, 1687.876623511314392, 134.0, 21.0 ],
					"text" : "s #0-alfa-to-python"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-272",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1256.500006526708603, 1028.0, 134.0, 21.0 ],
					"text" : "r #0-alfa-to-python"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-270",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1286.500006526708603, 1281.0, 120.0, 45.0 ],
					"text" : "The last edited audio is played using spacebar"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-268",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "" ],
					"patching_rect" : [ 1234.674999237060547, 1376.666661441326141, 68.0, 21.0 ],
					"text" : "select 32"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-265",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 4,
					"outlettype" : [ "int", "int", "int", "int" ],
					"patching_rect" : [ 1234.674999237060547, 1347.666661441326141, 50.5, 21.0 ],
					"text" : "key"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-262",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 1003.649999260902405, 1431.100022912025452, 42.0, 21.0 ],
					"text" : "t f f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-263",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 1074.350007265806198, 1431.100022912025452, 42.0, 21.0 ],
					"text" : "t f f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-264",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 1081.350007265806198, 1468.100022912025452, 35.0, 21.0 ],
					"text" : "- 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-260",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1074.350007265806198, 1398.033345758914948, 115.0, 21.0 ],
					"text" : "r #0-audio-1-end"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-261",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1003.649999260902405, 1375.700025737285614, 128.0, 21.0 ],
					"text" : "r #0-audio-1-start"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-259",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 836.314893364906311, 729.16030185026932, 115.0, 21.0 ],
					"text" : "s #0-audio-1-end"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-258",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 937.649999260902405, 1553.10002863407135, 48.0, 21.0 ],
					"text" : "zl.reg"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-253",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 997.149999260902405, 1610.300016403198242, 29.5, 21.0 ],
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-254",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 891.0, 1553.10002863407135, 35.0, 21.0 ],
					"text" : "stop"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-255",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "" ],
					"patching_rect" : [ 891.0, 1517.933336079120636, 55.0, 21.0 ],
					"text" : "sel 0 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-256",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1003.649999260902405, 1527.800023317337036, 95.0, 21.0 ],
					"text" : "prepend start"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-257",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1003.649999260902405, 1498.900025010108948, 96.700008004903793, 21.0 ],
					"text" : "pack 0. 0. 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-252",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1365.400015354156494, 1633.600025415420532, 29.5, 21.0 ],
					"text" : "0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-248",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1240.200011527538209, 1572.90002566576004, 35.0, 21.0 ],
					"text" : "stop"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-246",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "" ],
					"patching_rect" : [ 1265.400015354156494, 1532.937605605552562, 55.0, 21.0 ],
					"text" : "sel 0 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-245",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1283.400015354156494, 1572.90002566576004, 48.0, 21.0 ],
					"text" : "zl.reg"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-244",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1384.400015354156494, 1535.90002566576004, 95.0, 21.0 ],
					"text" : "prepend start"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-243",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 1384.400015354156494, 1437.500027358531952, 42.0, 21.0 ],
					"text" : "t f f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-242",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 1455.100023359060287, 1437.500027358531952, 42.0, 21.0 ],
					"text" : "t f f"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-241",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 1462.100023359060287, 1474.500027358531952, 35.0, 21.0 ],
					"text" : "- 0."
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-240",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1384.400015354156494, 1503.500027358531952, 96.700008004903793, 21.0 ],
					"text" : "pack 0. 0. 0."
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 12.0,
					"id" : "obj-239",
					"linecount" : 2,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 537.900012389617928, 1530.209930956363678, 117.0, 35.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 865.90002400000003, 768.587120764476822, 212.0, 21.0 ],
					"text" : "Fill Duration by hand (s)->"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-228",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 643.299994766712075, 1575.94328373670578, 207.0, 21.0 ],
					"text" : "expr $f1 * 1000 * 10000. / $f2"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-223",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 643.299994766712075, 1544.209930956363678, 80.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1068.40002400000003, 768.587120764476822, 81.499999999999773, 21.0 ],
					"text" : "3.05"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-134",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1214.350007265806198, 1320.0, 68.0, 21.0 ],
					"text" : "zl.change"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-132",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1256.500006526708603, 1281.0, 28.0, 21.0 ],
					"text" : "t 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-122",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "int" ],
					"patching_rect" : [ 1214.350007265806198, 1281.0, 28.0, 21.0 ],
					"text" : "t 1"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-82",
					"int" : 1,
					"maxclass" : "gswitch2",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1214.350007265806198, 1413.33335280418396, 39.0, 32.0 ]
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"activebgoncolor" : [ 0.466667, 0.254902, 0.607843, 1.0 ],
					"activetextoncolor" : [ 0.996078431372549, 0.984313725490196, 0.984313725490196, 1.0 ],
					"fontname" : "Futura Medium",
					"fontsize" : 16.0,
					"id" : "obj-63",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 1265.400015354156494, 1492.900024920701981, 73.0, 33.000000178813934 ],
					"presentation" : 1,
					"presentation_rect" : [ 1152.906249284744263, 469.356740217223773, 69.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text[2]",
							"parameter_mmax" : 1,
							"parameter_shortname" : "live.text",
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_type" : 2
						}

					}
,
					"text" : "START",
					"texton" : "STOP",
					"varname" : "live.text[2]"
				}

			}
, 			{
				"box" : 				{
					"activebgcolor" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"activebgoncolor" : [ 0.466667, 0.254902, 0.607843, 1.0 ],
					"activetextoncolor" : [ 0.996078431372549, 0.984313725490196, 0.984313725490196, 1.0 ],
					"fontname" : "Futura Medium",
					"fontsize" : 16.0,
					"id" : "obj-23",
					"maxclass" : "live.text",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"parameter_enable" : 1,
					"patching_rect" : [ 891.0, 1474.500027358531952, 73.0, 33.000000178813934 ],
					"presentation" : 1,
					"presentation_rect" : [ 1152.906249284744263, 82.156739811912217, 69.0, 24.0 ],
					"saved_attribute_attributes" : 					{
						"valueof" : 						{
							"parameter_longname" : "live.text[1]",
							"parameter_mmax" : 1,
							"parameter_shortname" : "live.text",
							"parameter_enum" : [ "val1", "val2" ],
							"parameter_type" : 2
						}

					}
,
					"text" : "START",
					"texton" : "STOP",
					"varname" : "live.text[1]"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-60",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 194.782978653907776, 2519.276594877243042, 115.0, 21.0 ],
					"text" : "/test/connection"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"bgcolor2" : [ 0.129411764705882, 0.137254901960784, 0.149019607843137, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_color1" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"bgfillcolor_color2" : [ 0.129411764705882, 0.137254901960784, 0.149019607843137, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "gradient",
					"fontname" : "Lucida Sans Typewriter ",
					"gradient" : 1,
					"id" : "obj-26",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 194.782978653907776, 2490.543262541294098, 108.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 452.950012000000129, 569.356740217223887, 121.0, 21.0 ],
					"text" : "Test Connection"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-224",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1835.700001180171967, 1334.533324539661407, 75.0, 21.0 ],
					"text" : "fromsymbol"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-214",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 1835.700001180171967, 1362.499979197978973, 75.0, 21.0 ],
					"text" : "unpack 0 0"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-213",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1934.5, 1428.499979197978973, 81.0, 21.0 ],
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-212",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1835.700001180171967, 1428.499979197978973, 81.0, 21.0 ],
					"text" : "prepend set"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 16.0,
					"id" : "obj-210",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 11.782978653907776, 1569.44328373670578, 125.166672199964523, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 316.156739811912189, 40.0, 25.0 ],
					"text" : "Run"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-153",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 178.216324299573898, 2391.876600682735443, 190.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 195.740114875534118, 593.449789712252709, 205.0, 19.0 ],
					"text" : "Reports from Python engine:"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"grad1" : [ 0.062745098039216, 0.066666666666667, 0.066666666666667, 1.0 ],
					"grad2" : [ 0.129411764705882, 0.137254901960784, 0.149019607843137, 1.0 ],
					"id" : "obj-207",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 178.216324299573898, 2462.776594877243042, 219.399999976158142, 16.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 3.972910090488426, 592.199789712252709, 569.977101909511589, 21.5 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-193",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 183.282978653907776, 1909.743311405181885, 240.0, 21.0 ],
					"text" : "prepend /sound/interpolate_two/save"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-194",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 183.282978653907776, 1942.743284046649933, 108.0, 21.0 ],
					"text" : "send #0-udpsend"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 14.0,
					"id" : "obj-204",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 183.282978653907776, 1873.943299174308777, 42.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 120.0, 422.784624813236519, 42.0, 25.0 ],
					"text" : "Save"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-190",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 11.782978653907776, 1909.743311405181885, 134.0, 21.0 ],
					"text" : "prepend /sound/stop"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-191",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 11.782978653907776, 1942.743284046649933, 108.0, 21.0 ],
					"text" : "send #0-udpsend"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 14.0,
					"id" : "obj-189",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 11.782978653907776, 1873.943299174308777, 46.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 251.947916090488434, 362.256740014567981, 46.0, 25.0 ],
					"text" : "STOP"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-188",
					"linecount" : 3,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 11.782978653907776, 1684.876623511314392, 167.0, 47.0 ],
					"text" : "prepend /sound/interpolate_two/play_again"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-187",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 11.782978653907776, 1740.87659615278244, 108.0, 21.0 ],
					"text" : "send #0-udpsend"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 14.0,
					"id" : "obj-180",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 11.782978653907776, 1619.376623511314392, 93.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 150.947916090488434, 362.256740014567981, 93.0, 25.0 ],
					"text" : "Play Again"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-185",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 11.782978653907776, 1652.276594877243042, 28.0, 21.0 ],
					"text" : "t b"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-179",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 575.299994766712075, 1842.876620292663574, 108.0, 21.0 ],
					"text" : "send #0-udpsend"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-178",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 575.299994766712075, 1807.876623511314392, 284.0, 21.0 ],
					"text" : "prepend /sound/interpolate_two/play_again"
				}

			}
, 			{
				"box" : 				{
					"dontreplace" : 1,
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-172",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 896.682972848415375, 2138.676614820957184, 307.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 4.0, 536.784624813236519, 266.0, 21.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-173",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 832.366309314966202, 2308.276591658592224, 108.0, 21.0 ],
					"text" : "send #0-udpsend"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-174",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 832.366309314966202, 2275.876600682735443, 287.0, 21.0 ],
					"text" : "prepend /sound/interpolate_two/save_folder"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-177",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 832.366309314966202, 2165.876600682735443, 161.0, 21.0 ],
					"text" : "conformpath native boot"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-170",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1256.500006526708603, 1059.641877027412193, 234.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 915.90002400000003, 283.156739811912189, 234.0, 21.0 ],
					"text" : "send interpolation curve to python"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 14.0,
					"id" : "obj-168",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 183.282978653907776, 1619.376623511314392, 135.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 4.0, 362.256740014567981, 135.0, 25.0 ],
					"text" : "Generate $ Play"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-167",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 183.282978653907776, 1652.276594877243042, 42.0, 21.0 ],
					"text" : "t b b"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 16.0,
					"id" : "obj-166",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 851.682972848415375, 2066.876600682735443, 159.5, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 77.105209858017929, 479.784624813236519, 119.5, 25.0 ],
					"text" : "Save Folder"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-163",
					"maxclass" : "dropfile",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 832.366309314966202, 2036.876600682735443, 195.0, 85.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 4.0, 449.784624813236519, 265.710419716035858, 85.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-158",
					"linecount" : 3,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1613.200003826618286, 783.804269419143679, 36.0, 47.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 767.950012000000015, 287.156739811912189, 88.0, 21.0 ],
					"text" : "fill sin 1 1"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 16.0,
					"id" : "obj-150",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 264.466315433382988, 2008.876600682735443, 125.166672199964523, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 247.078125, 149.656739811912189, 80.0, 25.0 ],
					"text" : "Dataset"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-149",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 554.400006413459778, 942.100001335144043, 136.75, 21.0 ],
					"text" : "unpack 0. 0."
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 14.0,
					"id" : "obj-148",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1116.149999260902405, 1517.933336079120636, 119.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1152.906249284744263, 26.028645225705333, 76.0, 23.0 ],
					"text" : "Playback"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-142",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1815.400015294551849, 1469.166668057441711, 100.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 317.344802141982086, 505.148797694298423, 100.0, 19.0 ],
					"text" : "Output"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-141",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1703.80000114440918, 1469.166668057441711, 100.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 317.344802141982086, 453.320913300941356, 100.0, 19.0 ],
					"text" : "Input"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 16.0,
					"id" : "obj-139",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1562.200008004903793, 1466.166668057441711, 129.400014698505402, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 317.344802141982086, 358.256740014567981, 135.0, 25.0 ],
					"text" : "Python Audio"
				}

			}
, 			{
				"box" : 				{
					"autopopulate" : 1,
					"id" : "obj-200",
					"items" : [ "472449__erokia__msfxp-sound-89.wav", ",", "472450__erokia__msfxp-sound-4.wav", ",", "472451__erokia__msfxp-sound-399.wav", ",", "472452__erokia__msfxp-sound-398.wav", ",", "472453__erokia__msfxp-sound-397.wav", ",", "472454__erokia__msfxp-sound-402.wav", ",", "472455__erokia__msfxp-sound-401.wav", ",", "472456__erokia__msfxp-sound-400.wav", ",", "472912__erokia__msfxp-sound-96.wav", ",", "472913__erokia__msfxp-sound-405.wav", ",", "472914__erokia__msfxp-sound-404.wav", ",", "472915__erokia__msfxp-sound-403.wav", ",", "472916__erokia__msfxp-sound-40.wav", ",", "472917__erokia__msfxp-sound-409.wav", ",", "472918__erokia__msfxp-sound-408.wav", ",", "472919__erokia__msfxp-sound-407.wav", ",", "472920__erokia__msfxp-sound-406.wav", ",", "472921__erokia__msfxp-sound-308.wav", ",", "472922__erokia__msfxp-sound-309.wav", ",", "472923__erokia__msfxp-sound-410.wav", ",", "472924__erokia__msfxp-sound-41.wav", ",", "472925__erokia__msfxp-sound-311.wav", ",", "472926__erokia__msfxp-sound-312.wav", ",", "472927__erokia__msfxp-sound-31.wav", ",", "472928__erokia__msfxp-sound-310.wav", ",", "472929__erokia__msfxp-sound-134.wav", ",", "472930__erokia__msfxp-sound-133.wav", ",", "472931__erokia__msfxp-sound-127.wav", ",", "472932__erokia__msfxp-sound-126.wav", ",", "472933__erokia__msfxp-sound-129.wav", ",", "472934__erokia__msfxp-sound-128.wav", ",", "472935__erokia__msfxp-sound-130.wav", ",", "472936__erokia__msfxp-sound-13.wav", ",", "472937__erokia__msfxp-sound-132.wav", ",", "472938__erokia__msfxp-sound-131.wav", ",", "472939__erokia__msfxp-sound-58.wav", ",", "472940__erokia__msfxp-sound-580.wav", ",", "472941__erokia__msfxp-sound-578.wav", ",", "472942__erokia__msfxp-sound-579.wav", ",", "472943__erokia__msfxp-sound-546.wav", ",", "472944__erokia__msfxp-sound-545.wav", ",", "472945__erokia__msfxp-sound-574.wav", ",", "472946__erokia__msfxp-sound-575.wav", ",", "472947__erokia__msfxp-sound-542.wav", ",", "472948__erokia__msfxp-sound-541.wav", ",", "472949__erokia__msfxp-sound-544.wav", ",", "472950__erokia__msfxp-sound-543.wav", ",", "472951__erokia__msfxp-sound-539.wav", ",", "472956__erokia__msfxp-sound-538.wav", ",", "472957__erokia__msfxp-sound-540.wav", ",", "472958__erokia__msfxp-sound-54.wav", ",", "472959__erokia__msfxp-sound-600.wav", ",", "472960__erokia__msfxp-sound-323.wav", ",", "472961__erokia__msfxp-sound-322.wav", ",", "472962__erokia__msfxp-sound-321.wav", ",", "472963__erokia__msfxp-sound-320.wav", ",", "472964__erokia__msfxp-sound-32.wav", ",", "472965__erokia__msfxp-sound-319.wav", ",", "472966__erokia__msfxp-sound-318.wav", ",", "472967__erokia__msfxp-sound-317.wav", ",", "472968__erokia__msfxp-sound-316.wav", ",", "472969__erokia__msfxp-sound-315.wav", ",", "472970__erokia__msfxp-sound-559.wav", ",", "472971__erokia__msfxp-sound-69.wav", ",", "472972__erokia__msfxp-sound-68.wav", ",", "472973__erokia__msfxp-sound-229.wav", ",", "472974__erokia__msfxp-sound-23.wav", ",", "472975__erokia__msfxp-sound-230.wav", ",", "472976__erokia__msfxp-sound-231.wav", ",", "472977__erokia__msfxp-sound-225.wav", ",", "472978__erokia__msfxp-sound-226.wav", ",", "472979__erokia__msfxp-sound-227.wav", ",", "472980__erokia__msfxp-sound-228.wav", ",", "472981__erokia__msfxp-sound-482.wav", ",", "472982__erokia__msfxp-sound-483.wav", ",", "472983__erokia__msfxp-sound-232.wav", ",", "472984__erokia__msfxp-sound-233.wav", ",", "472985__erokia__msfxp-sound-458.wav", ",", "472986__erokia__msfxp-sound-457.wav", ",", "472987__erokia__msfxp-sound-77.wav", ",", "472988__erokia__msfxp-sound-78.wav", ",", "472989__erokia__msfxp-sound-473.wav", ",", "472990__erokia__msfxp-sound-525.wav", ",", "472991__erokia__msfxp-sound-524.wav", ",", "472992__erokia__msfxp-sound-523.wav", ",", "472993__erokia__msfxp-sound-522.wav", ",", "472994__erokia__msfxp-sound-521.wav", ",", "472995__erokia__msfxp-sound-520.wav", ",", "472996__erokia__msfxp-sound-52.wav", ",", "472997__erokia__msfxp-sound-465.wav", ",", "472998__erokia__msfxp-sound-528.wav", ",", "472999__erokia__msfxp-sound-464.wav", ",", "473000__erokia__msfxp-sound-7.wav", ",", "473001__erokia__msfxp-sound-70.wav", ",", "473002__erokia__msfxp-sound-76.wav", ",", "473003__erokia__msfxp-sound-61.wav", ",", "473004__erokia__msfxp-sound-282.wav", ",", "473005__erokia__msfxp-sound-281.wav", ",", "473006__erokia__msfxp-sound-280.wav", ",", "473007__erokia__msfxp-sound-28.wav", ",", "473008__erokia__msfxp-sound-286.wav", ",", "473009__erokia__msfxp-sound-285.wav", ",", "473010__erokia__msfxp-sound-284.wav", ",", "473011__erokia__msfxp-sound-283.wav", ",", "473012__erokia__msfxp-sound-71.wav", ",", "473013__erokia__msfxp-sound-72.wav", ",", "473014__erokia__msfxp-sound-288.wav", ",", "473015__erokia__msfxp-sound-287.wav", ",", "473016__erokia__msfxp-sound-75.wav", ",", "473017__erokia__msfxp-sound-313.wav", ",", "473018__erokia__msfxp-sound-73.wav", ",", "473019__erokia__msfxp-sound-74.wav", ",", "473020__erokia__msfxp-sound-314.wav", ",", "473021__erokia__msfxp-sound-437.wav", ",", "473022__erokia__msfxp-sound-438.wav", ",", "473023__erokia__msfxp-sound-433.wav", ",", "473024__erokia__msfxp-sound-434.wav", ",", "473025__erokia__msfxp-sound-435.wav", ",", "473026__erokia__msfxp-sound-436.wav", ",", "473027__erokia__msfxp-sound-43.wav", ",", "473028__erokia__msfxp-sound-430.wav", ",", "473029__erokia__msfxp-sound-431.wav", ",", "473030__erokia__msfxp-sound-432.wav", ",", "473031__erokia__msfxp-sound-135.wav", ",", "473032__erokia__msfxp-sound-136.wav", ",", "473033__erokia__msfxp-sound-137.wav", ",", "473034__erokia__msfxp-sound-138.wav", ",", "473035__erokia__msfxp-sound-139.wav", ",", "473036__erokia__msfxp-sound-14.wav", ",", "473037__erokia__msfxp-sound-140.wav", ",", "473038__erokia__msfxp-sound-141.wav", ",", "473039__erokia__msfxp-sound-142.wav", ",", "473040__erokia__msfxp-sound-143.wav", ",", "473041__erokia__msfxp-sound-306.wav", ",", "473042__erokia__msfxp-sound-307.wav", ",", "473043__erokia__msfxp-sound-197.wav", ",", "473044__erokia__msfxp-sound-198.wav", ",", "473045__erokia__msfxp-sound-573.wav", ",", "473046__erokia__msfxp-sound-572.wav", ",", "473047__erokia__msfxp-sound-19.wav", ",", "473048__erokia__msfxp-sound-190.wav", ",", "473049__erokia__msfxp-sound-191.wav", ",", "473050__erokia__msfxp-sound-192.wav", ",", "473051__erokia__msfxp-sound-193.wav", ",", "473052__erokia__msfxp-sound-194.wav", ",", "473053__erokia__msfxp-sound-195.wav", ",", "473054__erokia__msfxp-sound-196.wav", ",", "473055__erokia__msfxp-sound-368.wav", ",", "473056__erokia__msfxp-sound-369.wav", ",", "473057__erokia__msfxp-sound-360.wav", ",", "473058__erokia__msfxp-sound-361.wav", ",", "473059__erokia__msfxp-sound-362.wav", ",", "473060__erokia__msfxp-sound-363.wav", ",", "473061__erokia__msfxp-sound-364.wav", ",", "473062__erokia__msfxp-sound-365.wav", ",", "473063__erokia__msfxp-sound-366.wav", ",", "473064__erokia__msfxp-sound-367.wav", ",", "473065__erokia__msfxp-sound-273.wav", ",", "473066__erokia__msfxp-sound-272.wav", ",", "473067__erokia__msfxp-sound-271.wav", ",", "473068__erokia__msfxp-sound-270.wav", ",", "473069__erokia__msfxp-sound-277.wav", ",", "473070__erokia__msfxp-sound-276.wav", ",", "473071__erokia__msfxp-sound-275.wav", ",", "473072__erokia__msfxp-sound-274.wav", ",", "473073__erokia__msfxp-sound-279.wav", ",", "473074__erokia__msfxp-sound-278.wav", ",", "473075__erokia__msfxp-sound-10.wav", ",", "473076__erokia__msfxp-sound-1.wav", ",", "473077__erokia__msfxp-sound-92.wav", ",", "473078__erokia__msfxp-sound-93.wav", ",", "473079__erokia__msfxp-sound-492.wav", ",", "473080__erokia__msfxp-sound-491.wav", ",", "473081__erokia__msfxp-sound-88.wav", ",", "473082__erokia__msfxp-sound-9.wav", ",", "473083__erokia__msfxp-sound-90.wav", ",", "473084__erokia__msfxp-sound-91.wav", ",", "473085__erokia__msfxp-sound-487.wav", ",", "473088__erokia__msfxp-sound-486.wav", ",", "473089__erokia__msfxp-sound-485.wav", ",", "473090__erokia__msfxp-sound-484.wav", ",", "473091__erokia__msfxp-sound-490.wav", ",", "473092__erokia__msfxp-sound-49.wav", ",", "473093__erokia__msfxp-sound-489.wav", ",", "473094__erokia__msfxp-sound-488.wav", ",", "473095__erokia__msfxp-sound-107.wav", ",", "473096__erokia__msfxp-sound-106.wav", ",", "473097__erokia__msfxp-sound-388.wav", ",", "473098__erokia__msfxp-sound-389.wav", ",", "473099__erokia__msfxp-sound-39.wav", ",", "473100__erokia__msfxp-sound-390.wav", ",", "473101__erokia__msfxp-sound-391.wav", ",", "473102__erokia__msfxp-sound-392.wav", ",", "473103__erokia__msfxp-sound-393.wav", ",", "473104__erokia__msfxp-sound-394.wav", ",", "473105__erokia__msfxp-sound-395.wav", ",", "473106__erokia__msfxp-sound-396.wav", ",", "473107__erokia__msfxp-sound-560.wav", ",", "473108__erokia__msfxp-sound-549.wav", ",", "473109__erokia__msfxp-sound-548.wav", ",", "473110__erokia__msfxp-sound-547.wav", ",", "473111__erokia__msfxp-sound-537.wav", ",", "473112__erokia__msfxp-sound-552.wav", ",", "473113__erokia__msfxp-sound-551.wav", ",", "473114__erokia__msfxp-sound-550.wav", ",", "473115__erokia__msfxp-sound-55.wav", ",", "473116__erokia__msfxp-sound-417.wav", ",", "473117__erokia__msfxp-sound-418.wav", ",", "473118__erokia__msfxp-sound-554.wav", ",", "473119__erokia__msfxp-sound-553.wav", ",", "473120__erokia__msfxp-sound-420.wav", ",", "473121__erokia__msfxp-sound-421.wav", ",", "473122__erokia__msfxp-sound-419.wav", ",", "473123__erokia__msfxp-sound-42.wav", ",", "473124__erokia__msfxp-sound-156.wav", ",", "473125__erokia__msfxp-sound-155.wav", ",", "473126__erokia__msfxp-sound-149.wav", ",", "473127__erokia__msfxp-sound-148.wav", ",", "473128__erokia__msfxp-sound-150.wav", ",", "473129__erokia__msfxp-sound-15.wav", ",", "473130__erokia__msfxp-sound-152.wav", ",", "473131__erokia__msfxp-sound-151.wav", ",", "473132__erokia__msfxp-sound-154.wav", ",", "473133__erokia__msfxp-sound-153.wav", ",", "473134__erokia__msfxp-sound-441.wav", ",", "473135__erokia__msfxp-sound-440.wav", ",", "473136__erokia__msfxp-sound-44.wav", ",", "473137__erokia__msfxp-sound-439.wav", ",", "473146__erokia__msfxp-sound-585.wav", ",", "473147__erokia__msfxp-sound-584.wav", ",", "473148__erokia__msfxp-sound-583.wav", ",", "473149__erokia__msfxp-sound-582.wav", ",", "473150__erokia__msfxp-sound-589.wav", ",", "473151__erokia__msfxp-sound-588.wav", ",", "473152__erokia__msfxp-sound-587.wav", ",", "473153__erokia__msfxp-sound-586.wav", ",", "473154__erokia__msfxp-sound-444.wav", ",", "473155__erokia__msfxp-sound-445.wav", ",", "473156__erokia__msfxp-sound-590.wav", ",", "473157__erokia__msfxp-sound-59.wav", ",", "473158__erokia__msfxp-sound-448.wav", ",", "473159__erokia__msfxp-sound-449.wav", ",", "473160__erokia__msfxp-sound-446.wav", ",", "473161__erokia__msfxp-sound-447.wav", ",", "473162__erokia__msfxp-sound-165.wav", ",", "473163__erokia__msfxp-sound-164.wav", ",", "473164__erokia__msfxp-sound-158.wav", ",", "473165__erokia__msfxp-sound-157.wav", ",", "473166__erokia__msfxp-sound-16.wav", ",", "473167__erokia__msfxp-sound-159.wav", ",", "473168__erokia__msfxp-sound-161.wav", ",", "473169__erokia__msfxp-sound-160.wav", ",", "473170__erokia__msfxp-sound-163.wav", ",", "473171__erokia__msfxp-sound-162.wav", ",", "473172__erokia__msfxp-sound-461.wav", ",", "473173__erokia__msfxp-sound-460.wav", ",", "473174__erokia__msfxp-sound-46.wav", ",", "473175__erokia__msfxp-sound-459.wav", ",", "473176__erokia__msfxp-sound-456.wav", ",", "473177__erokia__msfxp-sound-455.wav", ",", "473178__erokia__msfxp-sound-454.wav", ",", "473179__erokia__msfxp-sound-453.wav", ",", "473180__erokia__msfxp-sound-452.wav", ",", "473181__erokia__msfxp-sound-451.wav", ",", "473182__erokia__msfxp-sound-296.wav", ",", "473183__erokia__msfxp-sound-297.wav", ",", "473184__erokia__msfxp-sound-298.wav", ",", "473185__erokia__msfxp-sound-299.wav", ",", "473186__erokia__msfxp-sound-292.wav", ",", "473187__erokia__msfxp-sound-293.wav", ",", "473188__erokia__msfxp-sound-294.wav", ",", "473189__erokia__msfxp-sound-295.wav", ",", "473190__erokia__msfxp-sound-3.wav", ",", "473191__erokia__msfxp-sound-30.wav", ",", "473192__erokia__msfxp-sound-376.wav", ",", "473193__erokia__msfxp-sound-375.wav", ",", "473194__erokia__msfxp-sound-374.wav", ",", "473195__erokia__msfxp-sound-373.wav", ",", "473196__erokia__msfxp-sound-38.wav", ",", "473197__erokia__msfxp-sound-379.wav", ",", "473198__erokia__msfxp-sound-378.wav", ",", "473199__erokia__msfxp-sound-377.wav", ",", "473200__erokia__msfxp-sound-381.wav", ",", "473201__erokia__msfxp-sound-380.wav", ",", "473202__erokia__msfxp-sound-45.wav", ",", "473203__erokia__msfxp-sound-450.wav", ",", "473204__erokia__msfxp-sound-95.wav", ",", "473205__erokia__msfxp-sound-97.wav", ",", "473206__erokia__msfxp-sound-85.wav", ",", "473207__erokia__msfxp-sound-86.wav", ",", "473208__erokia__msfxp-sound-87.wav", ",", "473209__erokia__msfxp-sound-94.wav", ",", "473210__erokia__msfxp-sound-81.wav", ",", "473211__erokia__msfxp-sound-82.wav", ",", "473212__erokia__msfxp-sound-83.wav", ",", "473213__erokia__msfxp-sound-84.wav", ",", "473214__erokia__msfxp-sound-166.wav", ",", "473215__erokia__msfxp-sound-167.wav", ",", "473216__erokia__msfxp-sound-168.wav", ",", "473217__erokia__msfxp-sound-169.wav", ",", "473218__erokia__msfxp-sound-17.wav", ",", "473219__erokia__msfxp-sound-170.wav", ",", "473220__erokia__msfxp-sound-171.wav", ",", "473221__erokia__msfxp-sound-172.wav", ",", "473222__erokia__msfxp-sound-173.wav", ",", "473223__erokia__msfxp-sound-174.wav", ",", "473224__erokia__msfxp-sound-442.wav", ",", "473225__erokia__msfxp-sound-443.wav", ",", "473226__erokia__msfxp-sound-245.wav", ",", "473227__erokia__msfxp-sound-246.wav", ",", "473228__erokia__msfxp-sound-238.wav", ",", "473229__erokia__msfxp-sound-239.wav", ",", "473230__erokia__msfxp-sound-24.wav", ",", "473231__erokia__msfxp-sound-240.wav", ",", "473232__erokia__msfxp-sound-241.wav", ",", "473233__erokia__msfxp-sound-242.wav", ",", "473234__erokia__msfxp-sound-243.wav", ",", "473235__erokia__msfxp-sound-244.wav", ",", "473236__erokia__msfxp-sound-519.wav", ",", "473237__erokia__msfxp-sound-526.wav", ",", "473238__erokia__msfxp-sound-511.wav", ",", "473239__erokia__msfxp-sound-512.wav", ",", "473240__erokia__msfxp-sound-513.wav", ",", "473241__erokia__msfxp-sound-514.wav", ",", "473242__erokia__msfxp-sound-515.wav", ",", "473243__erokia__msfxp-sound-516.wav", ",", "473244__erokia__msfxp-sound-517.wav", ",", "473245__erokia__msfxp-sound-518.wav", ",", "473246__erokia__msfxp-sound-358.wav", ",", "473247__erokia__msfxp-sound-357.wav", ",", "473248__erokia__msfxp-sound-356.wav", ",", "473249__erokia__msfxp-sound-355.wav", ",", "473250__erokia__msfxp-sound-370.wav", ",", "473251__erokia__msfxp-sound-37.wav", ",", "473252__erokia__msfxp-sound-36.wav", ",", "473253__erokia__msfxp-sound-359.wav", ",", "473254__erokia__msfxp-sound-372.wav", ",", "473255__erokia__msfxp-sound-371.wav", ",", "473256__erokia__msfxp-sound-101.wav", ",", "473257__erokia__msfxp-sound-100.wav", ",", "473258__erokia__msfxp-sound-110.wav", ",", "473259__erokia__msfxp-sound-11.wav", ",", "473260__erokia__msfxp-sound-566.wav", ",", "473261__erokia__msfxp-sound-567.wav", ",", "473262__erokia__msfxp-sound-568.wav", ",", "473263__erokia__msfxp-sound-569.wav", ",", "473264__erokia__msfxp-sound-57.wav", ",", "473265__erokia__msfxp-sound-570.wav", ",", "473266__erokia__msfxp-sound-571.wav", ",", "473267__erokia__msfxp-sound-576.wav", ",", "473268__erokia__msfxp-sound-577.wav", ",", "473269__erokia__msfxp-sound-581.wav", ",", "473270__erokia__msfxp-sound-471.wav", ",", "473271__erokia__msfxp-sound-472.wav", ",", "473272__erokia__msfxp-sound-468.wav", ",", "473273__erokia__msfxp-sound-469.wav", ",", "473274__erokia__msfxp-sound-47.wav", ",", "473275__erokia__msfxp-sound-470.wav", ",", "473276__erokia__msfxp-sound-462.wav", ",", "473277__erokia__msfxp-sound-463.wav", ",", "473278__erokia__msfxp-sound-466.wav", ",", "473279__erokia__msfxp-sound-467.wav", ",", "473280__erokia__msfxp-sound-338.wav", ",", "473281__erokia__msfxp-sound-337.wav", ",", "473282__erokia__msfxp-sound-34.wav", ",", "473283__erokia__msfxp-sound-339.wav", ",", "473284__erokia__msfxp-sound-341.wav", ",", "473285__erokia__msfxp-sound-340.wav", ",", "473286__erokia__msfxp-sound-343.wav", ",", "473287__erokia__msfxp-sound-342.wav", ",", "473288__erokia__msfxp-sound-345.wav", ",", "473289__erokia__msfxp-sound-344.wav", ",", "473290__erokia__msfxp-sound-382.wav", ",", "473291__erokia__msfxp-sound-383.wav", ",", "473292__erokia__msfxp-sound-384.wav", ",", "473293__erokia__msfxp-sound-385.wav", ",", "473294__erokia__msfxp-sound-386.wav", ",", "473295__erokia__msfxp-sound-387.wav", ",", "473296__erokia__msfxp-sound-411.wav", ",", "473297__erokia__msfxp-sound-412.wav", ",", "473298__erokia__msfxp-sound-413.wav", ",", "473299__erokia__msfxp-sound-414.wav", ",", "473300__erokia__msfxp-sound-80.wav", ",", "473301__erokia__msfxp-sound-8.wav", ",", "473302__erokia__msfxp-sound-62.wav", ",", "473303__erokia__msfxp-sound-60.wav", ",", "473304__erokia__msfxp-sound-64.wav", ",", "473305__erokia__msfxp-sound-63.wav", ",", "473306__erokia__msfxp-sound-66.wav", ",", "473307__erokia__msfxp-sound-65.wav", ",", "473308__erokia__msfxp-sound-79.wav", ",", "473309__erokia__msfxp-sound-67.wav", ",", "473310__erokia__msfxp-sound-183.wav", ",", "473311__erokia__msfxp-sound-182.wav", ",", "473312__erokia__msfxp-sound-181.wav", ",", "473313__erokia__msfxp-sound-180.wav", ",", "473314__erokia__msfxp-sound-18.wav", ",", "473315__erokia__msfxp-sound-179.wav", ",", "473316__erokia__msfxp-sound-178.wav", ",", "473317__erokia__msfxp-sound-177.wav", ",", "473318__erokia__msfxp-sound-176.wav", ",", "473319__erokia__msfxp-sound-175.wav", ",", "473320__erokia__msfxp-sound-27.wav", ",", "473321__erokia__msfxp-sound-269.wav", ",", "473322__erokia__msfxp-sound-29.wav", ",", "473323__erokia__msfxp-sound-289.wav", ",", "473324__erokia__msfxp-sound-266.wav", ",", "473325__erokia__msfxp-sound-265.wav", ",", "473326__erokia__msfxp-sound-268.wav", ",", "473327__erokia__msfxp-sound-267.wav", ",", "473328__erokia__msfxp-sound-291.wav", ",", "473329__erokia__msfxp-sound-290.wav", ",", "473330__erokia__msfxp-sound-593.wav", ",", "473331__erokia__msfxp-sound-594.wav", ",", "473332__erokia__msfxp-sound-346.wav", ",", "473333__erokia__msfxp-sound-347.wav", ",", "473334__erokia__msfxp-sound-348.wav", ",", "473335__erokia__msfxp-sound-349.wav", ",", "473336__erokia__msfxp-sound-35.wav", ",", "473337__erokia__msfxp-sound-350.wav", ",", "473338__erokia__msfxp-sound-351.wav", ",", "473339__erokia__msfxp-sound-352.wav", ",", "473340__erokia__msfxp-sound-353.wav", ",", "473341__erokia__msfxp-sound-354.wav", ",", "473342__erokia__msfxp-sound-599.wav", ",", "473343__erokia__msfxp-sound-6.wav", ",", "473344__erokia__msfxp-sound-218.wav", ",", "473345__erokia__msfxp-sound-219.wav", ",", "473346__erokia__msfxp-sound-214.wav", ",", "473347__erokia__msfxp-sound-215.wav", ",", "473348__erokia__msfxp-sound-216.wav", ",", "473349__erokia__msfxp-sound-217.wav", ",", "473350__erokia__msfxp-sound-210.wav", ",", "473351__erokia__msfxp-sound-211.wav", ",", "473352__erokia__msfxp-sound-212.wav", ",", "473353__erokia__msfxp-sound-213.wav", ",", "473354__erokia__msfxp-sound-565.wav", ",", "473355__erokia__msfxp-sound-564.wav", ",", "473356__erokia__msfxp-sound-561.wav", ",", "473357__erokia__msfxp-sound-56.wav", ",", "473358__erokia__msfxp-sound-563.wav", ",", "473359__erokia__msfxp-sound-562.wav", ",", "473360__erokia__msfxp-sound-556.wav", ",", "473361__erokia__msfxp-sound-555.wav", ",", "473362__erokia__msfxp-sound-558.wav", ",", "473363__erokia__msfxp-sound-557.wav", ",", "473364__erokia__msfxp-sound-114.wav", ",", "473365__erokia__msfxp-sound-113.wav", ",", "473366__erokia__msfxp-sound-112.wav", ",", "473367__erokia__msfxp-sound-111.wav", ",", "473368__erokia__msfxp-sound-118.wav", ",", "473369__erokia__msfxp-sound-117.wav", ",", "473370__erokia__msfxp-sound-116.wav", ",", "473371__erokia__msfxp-sound-115.wav", ",", "473372__erokia__msfxp-sound-12.wav", ",", "473373__erokia__msfxp-sound-119.wav", ",", "473374__erokia__msfxp-sound-493.wav", ",", "473375__erokia__msfxp-sound-481.wav", ",", "473376__erokia__msfxp-sound-475.wav", ",", "473377__erokia__msfxp-sound-474.wav", ",", "473378__erokia__msfxp-sound-477.wav", ",", "473379__erokia__msfxp-sound-476.wav", ",", "473380__erokia__msfxp-sound-479.wav", ",", "473381__erokia__msfxp-sound-478.wav", ",", "473382__erokia__msfxp-sound-480.wav", ",", "473383__erokia__msfxp-sound-48.wav", ",", "473384__erokia__msfxp-sound-199.wav", ",", "473385__erokia__msfxp-sound-2.wav", ",", "473386__erokia__msfxp-sound-188.wav", ",", "473387__erokia__msfxp-sound-189.wav", ",", "473388__erokia__msfxp-sound-186.wav", ",", "473389__erokia__msfxp-sound-187.wav", ",", "473390__erokia__msfxp-sound-184.wav", ",", "473391__erokia__msfxp-sound-185.wav", ",", "473392__erokia__msfxp-sound-20.wav", ",", "473393__erokia__msfxp-sound-200.wav", ",", "473394__erokia__msfxp-sound-335.wav", ",", "473395__erokia__msfxp-sound-336.wav", ",", "473396__erokia__msfxp-sound-333.wav", ",", "473397__erokia__msfxp-sound-334.wav", ",", "473398__erokia__msfxp-sound-331.wav", ",", "473399__erokia__msfxp-sound-332.wav", ",", "473400__erokia__msfxp-sound-33.wav", ",", "473401__erokia__msfxp-sound-330.wav", ",", "473402__erokia__msfxp-sound-328.wav", ",", "473403__erokia__msfxp-sound-329.wav", ",", "473404__erokia__msfxp-sound-597.wav", ",", "473405__erokia__msfxp-sound-598.wav", ",", "473406__erokia__msfxp-sound-595.wav", ",", "473407__erokia__msfxp-sound-596.wav", ",", "473408__erokia__msfxp-sound-429.wav", ",", "473409__erokia__msfxp-sound-428.wav", ",", "473410__erokia__msfxp-sound-591.wav", ",", "473411__erokia__msfxp-sound-592.wav", ",", "473412__erokia__msfxp-sound-425.wav", ",", "473413__erokia__msfxp-sound-424.wav", ",", "473414__erokia__msfxp-sound-427.wav", ",", "473415__erokia__msfxp-sound-426.wav", ",", "473416__erokia__msfxp-sound-416.wav", ",", "473417__erokia__msfxp-sound-415.wav", ",", "473418__erokia__msfxp-sound-423.wav", ",", "473419__erokia__msfxp-sound-422.wav", ",", "473420__erokia__msfxp-sound-146.wav", ",", "473421__erokia__msfxp-sound-147.wav", ",", "473422__erokia__msfxp-sound-122.wav", ",", "473423__erokia__msfxp-sound-123.wav", ",", "473424__erokia__msfxp-sound-120.wav", ",", "473425__erokia__msfxp-sound-121.wav", ",", "473426__erokia__msfxp-sound-144.wav", ",", "473427__erokia__msfxp-sound-145.wav", ",", "473428__erokia__msfxp-sound-124.wav", ",", "473429__erokia__msfxp-sound-125.wav", ",", "473430__erokia__msfxp-sound-258.wav", ",", "473431__erokia__msfxp-sound-259.wav", ",", "473432__erokia__msfxp-sound-256.wav", ",", "473433__erokia__msfxp-sound-257.wav", ",", "473434__erokia__msfxp-sound-261.wav", ",", "473435__erokia__msfxp-sound-262.wav", ",", "473436__erokia__msfxp-sound-26.wav", ",", "473437__erokia__msfxp-sound-260.wav", ",", "473438__erokia__msfxp-sound-263.wav", ",", "473439__erokia__msfxp-sound-264.wav", ",", "473440__erokia__msfxp-sound-325.wav", ",", "473441__erokia__msfxp-sound-324.wav", ",", "473442__erokia__msfxp-sound-305.wav", ",", "473443__erokia__msfxp-sound-304.wav", ",", "473444__erokia__msfxp-sound-303.wav", ",", "473445__erokia__msfxp-sound-302.wav", ",", "473446__erokia__msfxp-sound-301.wav", ",", "473447__erokia__msfxp-sound-300.wav", ",", "473448__erokia__msfxp-sound-327.wav", ",", "473449__erokia__msfxp-sound-326.wav", ",", "473450__erokia__msfxp-sound-237.wav", ",", "473451__erokia__msfxp-sound-236.wav", ",", "473452__erokia__msfxp-sound-222.wav", ",", "473453__erokia__msfxp-sound-221.wav", ",", "473454__erokia__msfxp-sound-220.wav", ",", "473455__erokia__msfxp-sound-22.wav", ",", "473456__erokia__msfxp-sound-235.wav", ",", "473457__erokia__msfxp-sound-234.wav", ",", "473458__erokia__msfxp-sound-224.wav", ",", "473459__erokia__msfxp-sound-223.wav", ",", "473460__erokia__msfxp-sound-103.wav", ",", "473461__erokia__msfxp-sound-102.wav", ",", "473462__erokia__msfxp-sound-535.wav", ",", "473463__erokia__msfxp-sound-536.wav", ",", "473464__erokia__msfxp-sound-109.wav", ",", "473465__erokia__msfxp-sound-108.wav", ",", "473466__erokia__msfxp-sound-105.wav", ",", "473467__erokia__msfxp-sound-104.wav", ",", "473468__erokia__msfxp-sound-53.wav", ",", "473469__erokia__msfxp-sound-530.wav", ",", "473470__erokia__msfxp-sound-527.wav", ",", "473471__erokia__msfxp-sound-529.wav", ",", "473472__erokia__msfxp-sound-533.wav", ",", "473473__erokia__msfxp-sound-534.wav", ",", "473474__erokia__msfxp-sound-531.wav", ",", "473475__erokia__msfxp-sound-532.wav", ",", "473476__erokia__msfxp-sound-5.wav", ",", "473477__erokia__msfxp-sound-50.wav", ",", "473478__erokia__msfxp-sound-498.wav", ",", "473479__erokia__msfxp-sound-499.wav", ",", "473480__erokia__msfxp-sound-496.wav", ",", "473481__erokia__msfxp-sound-497.wav", ",", "473482__erokia__msfxp-sound-494.wav", ",", "473483__erokia__msfxp-sound-495.wav", ",", "473484__erokia__msfxp-sound-500.wav", ",", "473485__erokia__msfxp-sound-501.wav", ",", "473486__erokia__msfxp-sound-99.wav", ",", "473487__erokia__msfxp-sound-98.wav", ",", "473488__erokia__msfxp-sound-206.wav", ",", "473489__erokia__msfxp-sound-205.wav", ",", "473490__erokia__msfxp-sound-208.wav", ",", "473491__erokia__msfxp-sound-207.wav", ",", "473492__erokia__msfxp-sound-202.wav", ",", "473493__erokia__msfxp-sound-201.wav", ",", "473494__erokia__msfxp-sound-204.wav", ",", "473495__erokia__msfxp-sound-203.wav", ",", "473496__erokia__msfxp-sound-21.wav", ",", "473497__erokia__msfxp-sound-209.wav", ",", "473498__erokia__msfxp-sound-255.wav", ",", "473499__erokia__msfxp-sound-254.wav", ",", "473500__erokia__msfxp-sound-25.wav", ",", "473501__erokia__msfxp-sound-249.wav", ",", "473502__erokia__msfxp-sound-248.wav", ",", "473503__erokia__msfxp-sound-247.wav", ",", "473504__erokia__msfxp-sound-253.wav", ",", "473505__erokia__msfxp-sound-252.wav", ",", "473506__erokia__msfxp-sound-251.wav", ",", "473507__erokia__msfxp-sound-250.wav", ",", "473508__erokia__msfxp-sound-510.wav", ",", "473509__erokia__msfxp-sound-51.wav", ",", "473510__erokia__msfxp-sound-505.wav", ",", "473511__erokia__msfxp-sound-504.wav", ",", "473512__erokia__msfxp-sound-503.wav", ",", "473513__erokia__msfxp-sound-502.wav", ",", "473514__erokia__msfxp-sound-509.wav", ",", "473515__erokia__msfxp-sound-508.wav", ",", "473516__erokia__msfxp-sound-507.wav", ",", "473517__erokia__msfxp-sound-506.wav", ",", "476940__erokia__msfxp2-175.wav", ",", "477332__erokia__msfxp2-192.wav", ",", "477374__erokia__msfxp2-205.wav", ",", "478084__erokia__msfxp2-222.wav", ",", "478297__erokia__msfxp2-314.wav", ",", "478529__erokia__msfxp2-351-4-two-variations-of-the-same-pattern.wav", ",", "478548__erokia__msfxp2-264.wav", ",", "478575__erokia__msfxp2-387.wav", ",", "479319__erokia__msfxp2-199.wav", ",", "479440__erokia__msfxp2-183-5.wav", ",", "479744__erokia__msfxp2-267.wav", ",", "480936__erokia__msfxp2-32.wav", ",", "480937__erokia__msfxp2-33.wav", ",", "480938__erokia__msfxp2-27.wav", ",", "480939__erokia__msfxp2-28.wav", ",", "480940__erokia__msfxp2-25.wav", ",", "480941__erokia__msfxp2-26.wav", ",", "480942__erokia__msfxp2-30.wav", ",", "480943__erokia__msfxp2-31.wav", ",", "480944__erokia__msfxp2-29.wav", ",", "480945__erokia__msfxp2-3.wav", ",", "480946__erokia__msfxp2-42.wav", ",", "480947__erokia__msfxp2-41.wav", ",", "480948__erokia__msfxp2-35.wav", ",", "480949__erokia__msfxp2-34.wav", ",", "480950__erokia__msfxp2-37.wav", ",", "480951__erokia__msfxp2-36.wav", ",", "480952__erokia__msfxp2-39.wav", ",", "480953__erokia__msfxp2-38.wav", ",", "480954__erokia__msfxp2-40.wav", ",", "480955__erokia__msfxp2-4.wav", ",", "480956__erokia__msfxp2-85.wav", ",", "480957__erokia__msfxp2-86.wav", ",", "480958__erokia__msfxp2-81.wav", ",", "480959__erokia__msfxp2-82.wav", ",", "480960__erokia__msfxp2-83.wav", ",", "480961__erokia__msfxp2-84.wav", ",", "480962__erokia__msfxp2-78.wav", ",", "480963__erokia__msfxp2-79.wav", ",", "480964__erokia__msfxp2-8.wav", ",", "480965__erokia__msfxp2-80.wav", ",", "480966__erokia__msfxp2-94.wav", ",", "480967__erokia__msfxp2-93-2.wav", ",", "480968__erokia__msfxp2-9.wav", ",", "480969__erokia__msfxp2-89.wav", ",", "480970__erokia__msfxp2-88.wav", ",", "480971__erokia__msfxp2-87.wav", ",", "480972__erokia__msfxp2-93.wav", ",", "480973__erokia__msfxp2-92.wav", ",", "480974__erokia__msfxp2-91.wav", ",", "480975__erokia__msfxp2-90.wav", ",", "480976__erokia__msfxp2-195.wav", ",", "480977__erokia__msfxp2-19.wav", ",", "480978__erokia__msfxp2-18.wav", ",", "480979__erokia__msfxp2-22.wav", ",", "480980__erokia__msfxp2-21.wav", ",", "480981__erokia__msfxp2-20.wav", ",", "480982__erokia__msfxp2-2.wav", ",", "480983__erokia__msfxp2-24.wav", ",", "480984__erokia__msfxp2-23.wav", ",", "480985__erokia__msfxp2-11.wav", ",", "480986__erokia__msfxp2-100.wav", ",", "480987__erokia__msfxp2-10.wav", ",", "480988__erokia__msfxp2-1.wav", ",", "480989__erokia__msfxp2-15.wav", ",", "480990__erokia__msfxp2-14.wav", ",", "480991__erokia__msfxp2-13.wav", ",", "480992__erokia__msfxp2-12.wav", ",", "480993__erokia__msfxp2-17.wav", ",", "480994__erokia__msfxp2-16.wav", ",", "480995__erokia__msfxp2-67.wav", ",", "480996__erokia__msfxp2-68.wav", ",", "480997__erokia__msfxp2-65.wav", ",", "480998__erokia__msfxp2-66.wav", ",", "480999__erokia__msfxp2-63.wav", ",", "481000__erokia__msfxp2-64.wav", ",", "481001__erokia__msfxp2-61.wav", ",", "481002__erokia__msfxp2-62.wav", ",", "481003__erokia__msfxp2-69.wav", ",", "481004__erokia__msfxp2-7.wav", ",", "481005__erokia__msfxp2-74.wav", ",", "481006__erokia__msfxp2-73.wav", ",", "481007__erokia__msfxp2-75-2.wav", ",", "481008__erokia__msfxp2-75.wav", ",", "481009__erokia__msfxp2-70-2.wav", ",", "481010__erokia__msfxp2-70.wav", ",", "481011__erokia__msfxp2-72.wav", ",", "481012__erokia__msfxp2-71.wav", ",", "481013__erokia__msfxp2-77.wav", ",", "481014__erokia__msfxp2-76.wav", ",", "481015__erokia__msfxp2-43.wav", ",", "481016__erokia__msfxp2-44.wav", ",", "481017__erokia__msfxp2-45.wav", ",", "481018__erokia__msfxp2-46.wav", ",", "481019__erokia__msfxp2-47.wav", ",", "481020__erokia__msfxp2-48.wav", ",", "481021__erokia__msfxp2-49.wav", ",", "481022__erokia__msfxp2-5.wav", ",", "481023__erokia__msfxp2-50.wav", ",", "481024__erokia__msfxp2-51.wav", ",", "481025__erokia__msfxp2-95.wav", ",", "481026__erokia__msfxp2-96.wav", ",", "481027__erokia__msfxp2-97.wav", ",", "481028__erokia__msfxp2-98.wav", ",", "481029__erokia__msfxp2-99.wav", ",", "481030__erokia__msfxp2-60.wav", ",", "481031__erokia__msfxp2-6.wav", ",", "481032__erokia__msfxp2-59.wav", ",", "481033__erokia__msfxp2-58.wav", ",", "481034__erokia__msfxp2-57.wav", ",", "481035__erokia__msfxp2-56.wav", ",", "481036__erokia__msfxp2-55.wav", ",", "481037__erokia__msfxp2-54.wav", ",", "481038__erokia__msfxp2-53.wav", ",", "481039__erokia__msfxp2-52.wav", ",", "481138__erokia__msfxp2-420.wav", ",", "481152__erokia__msfxp2-218.wav", ",", "481153__erokia__msfxp2-217.wav", ",", "481154__erokia__msfxp2-220.wav", ",", "481155__erokia__msfxp2-219.wav", ",", "481156__erokia__msfxp2-214.wav", ",", "481157__erokia__msfxp2-213.wav", ",", "481158__erokia__msfxp2-216.wav", ",", "481159__erokia__msfxp2-215.wav", ",", "481160__erokia__msfxp2-284.wav", ",", "481161__erokia__msfxp2-283.wav", ",", "481162__erokia__msfxp2-285.wav", ",", "481163__erokia__msfxp2-284-2.wav", ",", "481164__erokia__msfxp2-221.wav", ",", "481165__erokia__msfxp2-282-3.wav", ",", "481166__erokia__msfxp2-282-2.wav", ",", "481167__erokia__msfxp2-287.wav", ",", "481168__erokia__msfxp2-286.wav", ",", "481169__erokia__msfxp2-405.wav", ",", "481170__erokia__msfxp2-250-3.wav", ",", "481171__erokia__msfxp2-250-4.wav", ",", "481172__erokia__msfxp2-124.wav", ",", "481173__erokia__msfxp2-125.wav", ",", "481174__erokia__msfxp2-252.wav", ",", "481175__erokia__msfxp2-253.wav", ",", "481176__erokia__msfxp2-254.wav", ",", "481177__erokia__msfxp2-255.wav", ",", "481178__erokia__msfxp2-119-3.wav", ",", "481179__erokia__msfxp2-120.wav", ",", "481180__erokia__msfxp2-119.wav", ",", "481181__erokia__msfxp2-119-2.wav", ",", "481182__erokia__msfxp2-122-2.wav", ",", "481183__erokia__msfxp2-123.wav", ",", "481184__erokia__msfxp2-121.wav", ",", "481185__erokia__msfxp2-122.wav", ",", "481186__erokia__msfxp2-207.wav", ",", "481187__erokia__msfxp2-208.wav", ",", "481188__erokia__msfxp2-206.wav", ",", "481189__erokia__msfxp2-210.wav", ",", "481190__erokia__msfxp2-210-2.wav", ",", "481191__erokia__msfxp2-209.wav", ",", "481192__erokia__msfxp2-209-2.wav", ",", "481193__erokia__msfxp2-290.wav", ",", "481194__erokia__msfxp2-282.wav", ",", "481195__erokia__msfxp2-211.wav", ",", "481196__erokia__msfxp2-212.wav", ",", "481197__erokia__msfxp2-294.wav", ",", "481198__erokia__msfxp2-294-2.wav", ",", "481199__erokia__msfxp2-292.wav", ",", "481204__erokia__msfxp2-281.wav", ",", "481205__erokia__msfxp2-411-2.wav", ",", "481206__erokia__msfxp2-257.wav", ",", "481207__erokia__msfxp2-400-3.wav", ",", "481208__erokia__msfxp2-406-2.wav", ",", "481209__erokia__msfxp2-415.wav", ",", "481210__erokia__msfxp2-414-2.wav", ",", "481211__erokia__msfxp2-131.wav", ",", "481212__erokia__msfxp2-130.wav", ",", "481213__erokia__msfxp2-125-3.wav", ",", "481214__erokia__msfxp2-125-2.wav", ",", "481215__erokia__msfxp2-127.wav", ",", "481216__erokia__msfxp2-126.wav", ",", "481217__erokia__msfxp2-128-2.wav", ",", "481218__erokia__msfxp2-128.wav", ",", "481219__erokia__msfxp2-129-2.wav", ",", "481220__erokia__msfxp2-129.wav", ",", "481221__erokia__msfxp2-233.wav", ",", "481222__erokia__msfxp2-232-3.wav", ",", "481223__erokia__msfxp2-232-2.wav", ",", "481224__erokia__msfxp2-232.wav", ",", "481225__erokia__msfxp2-179.wav", ",", "481226__erokia__msfxp2-180.wav", ",", "481227__erokia__msfxp2-230.wav", ",", "481228__erokia__msfxp2-229.wav", ",", "481229__erokia__msfxp2-176.wav", ",", "481230__erokia__msfxp2-177.wav", ",", "481231__erokia__msfxp2-178.wav", ",", "481232__erokia__msfxp2-171.wav", ",", "481233__erokia__msfxp2-172.wav", ",", "481234__erokia__msfxp2-173.wav", ",", "481235__erokia__msfxp2-174.wav", ",", "481236__erokia__msfxp2-264-2.wav", ",", "481237__erokia__msfxp2-235.wav", ",", "481238__erokia__msfxp2-413.wav", ",", "481239__erokia__msfxp2-411-3.wav", ",", "481240__erokia__msfxp2-293.wav", ",", "481241__erokia__msfxp2-298.wav", ",", "481242__erokia__msfxp2-225-2.wav", ",", "481243__erokia__msfxp2-225-3.wav", ",", "481244__erokia__msfxp2-184.wav", ",", "481245__erokia__msfxp2-222-2.wav", ",", "481246__erokia__msfxp2-223.wav", ",", "481247__erokia__msfxp2-224.wav", ",", "481248__erokia__msfxp2-225.wav", ",", "481249__erokia__msfxp2-182-2.wav", ",", "481250__erokia__msfxp2-182.wav", ",", "481251__erokia__msfxp2-181-2.wav", ",", "481252__erokia__msfxp2-181.wav", ",", "481253__erokia__msfxp2-183-4.wav", ",", "481254__erokia__msfxp2-183-3.wav", ",", "481255__erokia__msfxp2-183-2.wav", ",", "481256__erokia__msfxp2-183.wav", ",", "481257__erokia__msfxp2-112.wav", ",", "481258__erokia__msfxp2-111.wav", ",", "481259__erokia__msfxp2-110.wav", ",", "481260__erokia__msfxp2-109.wav", ",", "481261__erokia__msfxp2-116.wav", ",", "481262__erokia__msfxp2-115.wav", ",", "481263__erokia__msfxp2-114.wav", ",", "481264__erokia__msfxp2-113.wav", ",", "481265__erokia__msfxp2-118.wav", ",", "481266__erokia__msfxp2-117.wav", ",", "481267__erokia__msfxp2-297.wav", ",", "481268__erokia__msfxp2-225-4.wav", ",", "481269__erokia__msfxp2-226.wav", ",", "481270__erokia__msfxp2-410.wav", ",", "481271__erokia__msfxp2-406.wav", ",", "481272__erokia__msfxp2-411.wav", ",", "481273__erokia__msfxp2-102.wav", ",", "481274__erokia__msfxp2-101.wav", ",", "481275__erokia__msfxp2-100-3.wav", ",", "481276__erokia__msfxp2-100-2.wav", ",", "481277__erokia__msfxp2-106.wav", ",", "481278__erokia__msfxp2-105.wav", ",", "481279__erokia__msfxp2-104.wav", ",", "481280__erokia__msfxp2-103.wav", ",", "481281__erokia__msfxp2-108.wav", ",", "481282__erokia__msfxp2-107.wav", ",", "481283__erokia__msfxp2-243.wav", ",", "481284__erokia__msfxp2-242.wav", ",", "481285__erokia__msfxp2-245.wav", ",", "481286__erokia__msfxp2-244.wav", ",", "481287__erokia__msfxp2-247.wav", ",", "481288__erokia__msfxp2-246.wav", ",", "481289__erokia__msfxp2-249.wav", ",", "481290__erokia__msfxp2-248.wav", ",", "481291__erokia__msfxp2-250-2.wav", ",", "481292__erokia__msfxp2-250.wav", ",", "481293__erokia__msfxp2-412-2.wav", ",", "481294__erokia__msfxp2-412.wav", ",", "481295__erokia__msfxp2-413-2.wav", ",", "481296__erokia__msfxp2-408-2.wav", ",", "481297__erokia__msfxp2-414.wav", ",", "481298__erokia__msfxp2-413-3.wav", ",", "481299__erokia__msfxp2-409.wav", ",", "481300__erokia__msfxp2-227.wav", ",", "481301__erokia__msfxp2-250-5.wav", ",", "481302__erokia__msfxp2-228.wav", ",", "481303__erokia__msfxp2-158.wav", ",", "481304__erokia__msfxp2-159.wav", ",", "481305__erokia__msfxp2-156.wav", ",", "481306__erokia__msfxp2-157.wav", ",", "481307__erokia__msfxp2-154.wav", ",", "481308__erokia__msfxp2-155.wav", ",", "481309__erokia__msfxp2-152.wav", ",", "481310__erokia__msfxp2-153.wav", ",", "481311__erokia__msfxp2-404.wav", ",", "481312__erokia__msfxp2-407.wav", ",", "481313__erokia__msfxp2-160.wav", ",", "481314__erokia__msfxp2-161.wav", ",", "481315__erokia__msfxp2-420-2.wav", ",", "481316__erokia__msfxp2-421.wav", ",", "481317__erokia__msfxp2-418.wav", ",", "481318__erokia__msfxp2-419.wav", ",", "481319__erokia__msfxp2-416-3.wav", ",", "481320__erokia__msfxp2-291.wav", ",", "481321__erokia__msfxp2-416.wav", ",", "481322__erokia__msfxp2-416-2.wav", ",", "481323__erokia__msfxp2-256.wav", ",", "481324__erokia__msfxp2-241.wav", ",", "481325__erokia__msfxp2-241-2.wav", ",", "481326__erokia__msfxp2-239.wav", ",", "481327__erokia__msfxp2-240.wav", ",", "481328__erokia__msfxp2-238-2.wav", ",", "481329__erokia__msfxp2-238-3.wav", ",", "481330__erokia__msfxp2-237-2.wav", ",", "481331__erokia__msfxp2-238.wav", ",", "481332__erokia__msfxp2-236.wav", ",", "481333__erokia__msfxp2-237.wav", ",", "481334__erokia__msfxp2-296.wav", ",", "481335__erokia__msfxp2-417.wav", ",", "481336__erokia__msfxp2-166.wav", ",", "481337__erokia__msfxp2-165-2.wav", ",", "481338__erokia__msfxp2-168.wav", ",", "481339__erokia__msfxp2-167.wav", ",", "481340__erokia__msfxp2-163.wav", ",", "481341__erokia__msfxp2-162.wav", ",", "481342__erokia__msfxp2-165.wav", ",", "481343__erokia__msfxp2-164.wav", ",", "481344__erokia__msfxp2-231-2.wav", ",", "481345__erokia__msfxp2-170.wav", ",", "481346__erokia__msfxp2-169.wav", ",", "481347__erokia__msfxp2-231.wav", ",", "481348__erokia__msfxp2-266.wav", ",", "481349__erokia__msfxp2-265-2.wav", ",", "481350__erokia__msfxp2-271.wav", ",", "481351__erokia__msfxp2-270.wav", ",", "481352__erokia__msfxp2-269.wav", ",", "481353__erokia__msfxp2-268.wav", ",", "481354__erokia__msfxp2-272.wav", ",", "481355__erokia__msfxp2-271-2.wav", ",", "481356__erokia__msfxp2-295.wav", ",", "481357__erokia__msfxp2-402.wav", ",", "481358__erokia__msfxp2-204.wav", ",", "481359__erokia__msfxp2-203.wav", ",", "481360__erokia__msfxp2-401.wav", ",", "481361__erokia__msfxp2-198.wav", ",", "481362__erokia__msfxp2-197.wav", ",", "481363__erokia__msfxp2-196.wav", ",", "481364__erokia__msfxp2-202.wav", ",", "481365__erokia__msfxp2-201.wav", ",", "481366__erokia__msfxp2-200.wav", ",", "481367__erokia__msfxp2-251.wav", ",", "481368__erokia__msfxp2-400-2.wav", ",", "481369__erokia__msfxp2-300.wav", ",", "481370__erokia__msfxp2-289.wav", ",", "481371__erokia__msfxp2-407-2.wav", ",", "481372__erokia__msfxp2-299.wav", ",", "481373__erokia__msfxp2-132.wav", ",", "481374__erokia__msfxp2-133.wav", ",", "481375__erokia__msfxp2-134.wav", ",", "481376__erokia__msfxp2-135.wav", ",", "481377__erokia__msfxp2-136.wav", ",", "481378__erokia__msfxp2-137.wav", ",", "481379__erokia__msfxp2-138.wav", ",", "481380__erokia__msfxp2-139.wav", ",", "481381__erokia__msfxp2-140.wav", ",", "481382__erokia__msfxp2-141.wav", ",", "481383__erokia__msfxp2-277.wav", ",", "481384__erokia__msfxp2-234.wav", ",", "481385__erokia__msfxp2-288.wav", ",", "481386__erokia__msfxp2-273.wav", ",", "481387__erokia__msfxp2-274.wav", ",", "481388__erokia__msfxp2-275.wav", ",", "481389__erokia__msfxp2-275-2.wav", ",", "481390__erokia__msfxp2-276.wav", ",", "481391__erokia__msfxp2-262-2.wav", ",", "481392__erokia__msfxp2-278.wav", ",", "481393__erokia__msfxp2-279.wav", ",", "481394__erokia__msfxp2-280.wav", ",", "481395__erokia__msfxp2-280-2.wav", ",", "481397__erokia__msfxp2-262.wav", ",", "481398__erokia__msfxp2-403.wav", ",", "481399__erokia__msfxp2-193.wav", ",", "481400__erokia__msfxp2-194.wav", ",", "481401__erokia__msfxp2-185.wav", ",", "481402__erokia__msfxp2-186.wav", ",", "481403__erokia__msfxp2-187.wav", ",", "481404__erokia__msfxp2-188.wav", ",", "481405__erokia__msfxp2-189.wav", ",", "481406__erokia__msfxp2-190.wav", ",", "481407__erokia__msfxp2-191.wav", ",", "481408__erokia__msfxp2-261.wav", ",", "481409__erokia__msfxp2-260.wav", ",", "481410__erokia__msfxp2-259.wav", ",", "481411__erokia__msfxp2-258.wav", ",", "481412__erokia__msfxp2-263.wav", ",", "481413__erokia__msfxp2-262-3.wav", ",", "481414__erokia__msfxp2-151.wav", ",", "481415__erokia__msfxp2-150.wav", ",", "481416__erokia__msfxp2-149.wav", ",", "481417__erokia__msfxp2-148.wav", ",", "481418__erokia__msfxp2-147.wav", ",", "481419__erokia__msfxp2-146.wav", ",", "481420__erokia__msfxp2-145.wav", ",", "481421__erokia__msfxp2-144.wav", ",", "481422__erokia__msfxp2-143.wav", ",", "481423__erokia__msfxp2-142.wav", ",", "481424__erokia__msfxp2-387-4.wav", ",", "481425__erokia__msfxp2-387-3.wav", ",", "481426__erokia__msfxp2-388.wav", ",", "481427__erokia__msfxp2-387-5.wav", ",", "481428__erokia__msfxp2-386.wav", ",", "481429__erokia__msfxp2-385-2.wav", ",", "481430__erokia__msfxp2-387-2.wav", ",", "481431__erokia__msfxp2-390.wav", ",", "481432__erokia__msfxp2-389.wav", ",", "481434__erokia__msfxp2-323.wav", ",", "481435__erokia__msfxp2-323-2.wav", ",", "481436__erokia__msfxp2-318.wav", ",", "481437__erokia__msfxp2-319.wav", ",", "481438__erokia__msfxp2-316.wav", ",", "481439__erokia__msfxp2-317.wav", ",", "481440__erokia__msfxp2-322.wav", ",", "481441__erokia__msfxp2-322-2.wav", ",", "481442__erokia__msfxp2-320.wav", ",", "481443__erokia__msfxp2-321.wav", ",", "481444__erokia__msfxp2-381.wav", ",", "481445__erokia__msfxp2-381-2.wav", ",", "481446__erokia__msfxp2-379.wav", ",", "481447__erokia__msfxp2-380.wav", ",", "481448__erokia__msfxp2-382.wav", ",", "481449__erokia__msfxp2-383.wav", ",", "481450__erokia__msfxp2-381-3.wav", ",", "481451__erokia__msfxp2-381-4.wav", ",", "481452__erokia__msfxp2-384.wav", ",", "481453__erokia__msfxp2-385.wav", ",", "481454__erokia__msfxp2-331.wav", ",", "481455__erokia__msfxp2-330-2.wav", ",", "481456__erokia__msfxp2-324-2.wav", ",", "481457__erokia__msfxp2-324.wav", ",", "481458__erokia__msfxp2-326.wav", ",", "481459__erokia__msfxp2-325.wav", ",", "481460__erokia__msfxp2-328.wav", ",", "481461__erokia__msfxp2-327.wav", ",", "481462__erokia__msfxp2-330.wav", ",", "481463__erokia__msfxp2-329.wav", ",", "481464__erokia__msfxp2-399.wav", ",", "481465__erokia__msfxp2-398-2.wav", ",", "481466__erokia__msfxp2-398.wav", ",", "481467__erokia__msfxp2-397-3.wav", ",", "481468__erokia__msfxp2-357.wav", ",", "481469__erokia__msfxp2-358.wav", ",", "481470__erokia__msfxp2-396.wav", ",", "481471__erokia__msfxp2-395-3.wav", ",", "481472__erokia__msfxp2-354.wav", ",", "481473__erokia__msfxp2-354-2.wav", ",", "481474__erokia__msfxp2-355.wav", ",", "481475__erokia__msfxp2-356.wav", ",", "481476__erokia__msfxp2-351-3.wav", ",", "481477__erokia__msfxp2-352.wav", ",", "481478__erokia__msfxp2-353.wav", ",", "481479__erokia__msfxp2-392-3.wav", ",", "481480__erokia__msfxp2-392-4.wav", ",", "481481__erokia__msfxp2-365-2.wav", ",", "481482__erokia__msfxp2-365.wav", ",", "481483__erokia__msfxp2-390-2.wav", ",", "481484__erokia__msfxp2-391.wav", ",", "481485__erokia__msfxp2-392.wav", ",", "481486__erokia__msfxp2-392-2.wav", ",", "481487__erokia__msfxp2-361.wav", ",", "481488__erokia__msfxp2-360.wav", ",", "481489__erokia__msfxp2-359.wav", ",", "481490__erokia__msfxp2-358-2.wav", ",", "481491__erokia__msfxp2-364.wav", ",", "481492__erokia__msfxp2-363.wav", ",", "481493__erokia__msfxp2-362.wav", ",", "481494__erokia__msfxp2-361-2.wav", ",", "481495__erokia__msfxp2-309-3.wav", ",", "481496__erokia__msfxp2-309-2.wav", ",", "481497__erokia__msfxp2-309.wav", ",", "481498__erokia__msfxp2-308.wav", ",", "481499__erokia__msfxp2-313.wav", ",", "481500__erokia__msfxp2-312.wav", ",", "481501__erokia__msfxp2-311.wav", ",", "481502__erokia__msfxp2-310.wav", ",", "481503__erokia__msfxp2-315.wav", ",", "481504__erokia__msfxp2-393.wav", ",", "481505__erokia__msfxp2-394.wav", ",", "481506__erokia__msfxp2-301-4.wav", ",", "481507__erokia__msfxp2-301-3.wav", ",", "481508__erokia__msfxp2-301-2.wav", ",", "481509__erokia__msfxp2-301.wav", ",", "481510__erokia__msfxp2-305.wav", ",", "481511__erokia__msfxp2-304.wav", ",", "481512__erokia__msfxp2-303.wav", ",", "481513__erokia__msfxp2-302.wav", ",", "481514__erokia__msfxp2-307.wav", ",", "481515__erokia__msfxp2-306.wav", ",", "481516__erokia__msfxp2-395.wav", ",", "481517__erokia__msfxp2-395-2.wav", ",", "481518__erokia__msfxp2-343-2.wav", ",", "481519__erokia__msfxp2-343-3.wav", ",", "481520__erokia__msfxp2-342-2.wav", ",", "481521__erokia__msfxp2-343.wav", ",", "481522__erokia__msfxp2-341.wav", ",", "481523__erokia__msfxp2-342.wav", ",", "481524__erokia__msfxp2-340.wav", ",", "481525__erokia__msfxp2-340-2.wav", ",", "481526__erokia__msfxp2-343-4.wav", ",", "481527__erokia__msfxp2-344.wav", ",", "481528__erokia__msfxp2-348.wav", ",", "481529__erokia__msfxp2-347-2.wav", ",", "481530__erokia__msfxp2-350.wav", ",", "481531__erokia__msfxp2-349.wav", ",", "481533__erokia__msfxp2-345.wav", ",", "481534__erokia__msfxp2-347.wav", ",", "481535__erokia__msfxp2-346-2.wav", ",", "481536__erokia__msfxp2-397-2.wav", ",", "481537__erokia__msfxp2-351-2.wav", ",", "481538__erokia__msfxp2-351.wav", ",", "481539__erokia__msfxp2-397.wav", ",", "481540__erokia__msfxp2-378.wav", ",", "481541__erokia__msfxp2-377-2.wav", ",", "481542__erokia__msfxp2-375.wav", ",", "481543__erokia__msfxp2-374-2.wav", ",", "481544__erokia__msfxp2-374.wav", ",", "481545__erokia__msfxp2-373.wav", ",", "481546__erokia__msfxp2-377.wav", ",", "481547__erokia__msfxp2-376-3.wav", ",", "481548__erokia__msfxp2-376-2.wav", ",", "481549__erokia__msfxp2-376.wav", ",", "481550__erokia__msfxp2-332.wav", ",", "481551__erokia__msfxp2-332-2.wav", ",", "481552__erokia__msfxp2-333.wav", ",", "481553__erokia__msfxp2-334.wav", ",", "481554__erokia__msfxp2-335.wav", ",", "481555__erokia__msfxp2-336.wav", ",", "481556__erokia__msfxp2-336-2.wav", ",", "481557__erokia__msfxp2-336-3.wav", ",", "481558__erokia__msfxp2-336-4.wav", ",", "481559__erokia__msfxp2-336-5.wav", ",", "481560__erokia__msfxp2-371.wav", ",", "481561__erokia__msfxp2-372.wav", ",", "481562__erokia__msfxp2-366.wav", ",", "481563__erokia__msfxp2-367.wav", ",", "481564__erokia__msfxp2-367-2.wav", ",", "481565__erokia__msfxp2-368.wav", ",", "481566__erokia__msfxp2-368-2.wav", ",", "481567__erokia__msfxp2-369.wav", ",", "481568__erokia__msfxp2-370.wav", ",", "481569__erokia__msfxp2-370-2.wav", ",", "481570__erokia__msfxp2-339-2.wav", ",", "481571__erokia__msfxp2-339.wav", ",", "481572__erokia__msfxp2-338.wav", ",", "481573__erokia__msfxp2-337-6-pax.wav", ",", "481574__erokia__msfxp2-337-5-pax.wav", ",", "481575__erokia__msfxp2-337-4-pax.wav", ",", "481576__erokia__msfxp2-337-3-pax.wav", ",", "481577__erokia__msfxp2-337-2-pax.wav", ",", "481578__erokia__msfxp2-337-pax.wav", ",", "481579__erokia__msfxp2-336-6.wav", ",", "481580__erokia__msfxp2-408.wav", ",", "481970__erokia__msfxp2-346.wav" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 12.691666066646576, 904.637607024143222, 156.0, 21.0 ],
					"prefix" : "D:/my_workspace/dataset/erokia/audio/",
					"presentation" : 1,
					"presentation_rect" : [ 616.106262000000015, 696.906739811912416, 156.0, 21.0 ]
				}

			}
, 			{
				"box" : 				{
					"autopopulate" : 1,
					"id" : "obj-91",
					"items" : [ "472449__erokia__msfxp-sound-89.wav", ",", "472450__erokia__msfxp-sound-4.wav", ",", "472451__erokia__msfxp-sound-399.wav", ",", "472452__erokia__msfxp-sound-398.wav", ",", "472453__erokia__msfxp-sound-397.wav", ",", "472454__erokia__msfxp-sound-402.wav", ",", "472455__erokia__msfxp-sound-401.wav", ",", "472456__erokia__msfxp-sound-400.wav", ",", "472912__erokia__msfxp-sound-96.wav", ",", "472913__erokia__msfxp-sound-405.wav", ",", "472914__erokia__msfxp-sound-404.wav", ",", "472915__erokia__msfxp-sound-403.wav", ",", "472916__erokia__msfxp-sound-40.wav", ",", "472917__erokia__msfxp-sound-409.wav", ",", "472918__erokia__msfxp-sound-408.wav", ",", "472919__erokia__msfxp-sound-407.wav", ",", "472920__erokia__msfxp-sound-406.wav", ",", "472921__erokia__msfxp-sound-308.wav", ",", "472922__erokia__msfxp-sound-309.wav", ",", "472923__erokia__msfxp-sound-410.wav", ",", "472924__erokia__msfxp-sound-41.wav", ",", "472925__erokia__msfxp-sound-311.wav", ",", "472926__erokia__msfxp-sound-312.wav", ",", "472927__erokia__msfxp-sound-31.wav", ",", "472928__erokia__msfxp-sound-310.wav", ",", "472929__erokia__msfxp-sound-134.wav", ",", "472930__erokia__msfxp-sound-133.wav", ",", "472931__erokia__msfxp-sound-127.wav", ",", "472932__erokia__msfxp-sound-126.wav", ",", "472933__erokia__msfxp-sound-129.wav", ",", "472934__erokia__msfxp-sound-128.wav", ",", "472935__erokia__msfxp-sound-130.wav", ",", "472936__erokia__msfxp-sound-13.wav", ",", "472937__erokia__msfxp-sound-132.wav", ",", "472938__erokia__msfxp-sound-131.wav", ",", "472939__erokia__msfxp-sound-58.wav", ",", "472940__erokia__msfxp-sound-580.wav", ",", "472941__erokia__msfxp-sound-578.wav", ",", "472942__erokia__msfxp-sound-579.wav", ",", "472943__erokia__msfxp-sound-546.wav", ",", "472944__erokia__msfxp-sound-545.wav", ",", "472945__erokia__msfxp-sound-574.wav", ",", "472946__erokia__msfxp-sound-575.wav", ",", "472947__erokia__msfxp-sound-542.wav", ",", "472948__erokia__msfxp-sound-541.wav", ",", "472949__erokia__msfxp-sound-544.wav", ",", "472950__erokia__msfxp-sound-543.wav", ",", "472951__erokia__msfxp-sound-539.wav", ",", "472956__erokia__msfxp-sound-538.wav", ",", "472957__erokia__msfxp-sound-540.wav", ",", "472958__erokia__msfxp-sound-54.wav", ",", "472959__erokia__msfxp-sound-600.wav", ",", "472960__erokia__msfxp-sound-323.wav", ",", "472961__erokia__msfxp-sound-322.wav", ",", "472962__erokia__msfxp-sound-321.wav", ",", "472963__erokia__msfxp-sound-320.wav", ",", "472964__erokia__msfxp-sound-32.wav", ",", "472965__erokia__msfxp-sound-319.wav", ",", "472966__erokia__msfxp-sound-318.wav", ",", "472967__erokia__msfxp-sound-317.wav", ",", "472968__erokia__msfxp-sound-316.wav", ",", "472969__erokia__msfxp-sound-315.wav", ",", "472970__erokia__msfxp-sound-559.wav", ",", "472971__erokia__msfxp-sound-69.wav", ",", "472972__erokia__msfxp-sound-68.wav", ",", "472973__erokia__msfxp-sound-229.wav", ",", "472974__erokia__msfxp-sound-23.wav", ",", "472975__erokia__msfxp-sound-230.wav", ",", "472976__erokia__msfxp-sound-231.wav", ",", "472977__erokia__msfxp-sound-225.wav", ",", "472978__erokia__msfxp-sound-226.wav", ",", "472979__erokia__msfxp-sound-227.wav", ",", "472980__erokia__msfxp-sound-228.wav", ",", "472981__erokia__msfxp-sound-482.wav", ",", "472982__erokia__msfxp-sound-483.wav", ",", "472983__erokia__msfxp-sound-232.wav", ",", "472984__erokia__msfxp-sound-233.wav", ",", "472985__erokia__msfxp-sound-458.wav", ",", "472986__erokia__msfxp-sound-457.wav", ",", "472987__erokia__msfxp-sound-77.wav", ",", "472988__erokia__msfxp-sound-78.wav", ",", "472989__erokia__msfxp-sound-473.wav", ",", "472990__erokia__msfxp-sound-525.wav", ",", "472991__erokia__msfxp-sound-524.wav", ",", "472992__erokia__msfxp-sound-523.wav", ",", "472993__erokia__msfxp-sound-522.wav", ",", "472994__erokia__msfxp-sound-521.wav", ",", "472995__erokia__msfxp-sound-520.wav", ",", "472996__erokia__msfxp-sound-52.wav", ",", "472997__erokia__msfxp-sound-465.wav", ",", "472998__erokia__msfxp-sound-528.wav", ",", "472999__erokia__msfxp-sound-464.wav", ",", "473000__erokia__msfxp-sound-7.wav", ",", "473001__erokia__msfxp-sound-70.wav", ",", "473002__erokia__msfxp-sound-76.wav", ",", "473003__erokia__msfxp-sound-61.wav", ",", "473004__erokia__msfxp-sound-282.wav", ",", "473005__erokia__msfxp-sound-281.wav", ",", "473006__erokia__msfxp-sound-280.wav", ",", "473007__erokia__msfxp-sound-28.wav", ",", "473008__erokia__msfxp-sound-286.wav", ",", "473009__erokia__msfxp-sound-285.wav", ",", "473010__erokia__msfxp-sound-284.wav", ",", "473011__erokia__msfxp-sound-283.wav", ",", "473012__erokia__msfxp-sound-71.wav", ",", "473013__erokia__msfxp-sound-72.wav", ",", "473014__erokia__msfxp-sound-288.wav", ",", "473015__erokia__msfxp-sound-287.wav", ",", "473016__erokia__msfxp-sound-75.wav", ",", "473017__erokia__msfxp-sound-313.wav", ",", "473018__erokia__msfxp-sound-73.wav", ",", "473019__erokia__msfxp-sound-74.wav", ",", "473020__erokia__msfxp-sound-314.wav", ",", "473021__erokia__msfxp-sound-437.wav", ",", "473022__erokia__msfxp-sound-438.wav", ",", "473023__erokia__msfxp-sound-433.wav", ",", "473024__erokia__msfxp-sound-434.wav", ",", "473025__erokia__msfxp-sound-435.wav", ",", "473026__erokia__msfxp-sound-436.wav", ",", "473027__erokia__msfxp-sound-43.wav", ",", "473028__erokia__msfxp-sound-430.wav", ",", "473029__erokia__msfxp-sound-431.wav", ",", "473030__erokia__msfxp-sound-432.wav", ",", "473031__erokia__msfxp-sound-135.wav", ",", "473032__erokia__msfxp-sound-136.wav", ",", "473033__erokia__msfxp-sound-137.wav", ",", "473034__erokia__msfxp-sound-138.wav", ",", "473035__erokia__msfxp-sound-139.wav", ",", "473036__erokia__msfxp-sound-14.wav", ",", "473037__erokia__msfxp-sound-140.wav", ",", "473038__erokia__msfxp-sound-141.wav", ",", "473039__erokia__msfxp-sound-142.wav", ",", "473040__erokia__msfxp-sound-143.wav", ",", "473041__erokia__msfxp-sound-306.wav", ",", "473042__erokia__msfxp-sound-307.wav", ",", "473043__erokia__msfxp-sound-197.wav", ",", "473044__erokia__msfxp-sound-198.wav", ",", "473045__erokia__msfxp-sound-573.wav", ",", "473046__erokia__msfxp-sound-572.wav", ",", "473047__erokia__msfxp-sound-19.wav", ",", "473048__erokia__msfxp-sound-190.wav", ",", "473049__erokia__msfxp-sound-191.wav", ",", "473050__erokia__msfxp-sound-192.wav", ",", "473051__erokia__msfxp-sound-193.wav", ",", "473052__erokia__msfxp-sound-194.wav", ",", "473053__erokia__msfxp-sound-195.wav", ",", "473054__erokia__msfxp-sound-196.wav", ",", "473055__erokia__msfxp-sound-368.wav", ",", "473056__erokia__msfxp-sound-369.wav", ",", "473057__erokia__msfxp-sound-360.wav", ",", "473058__erokia__msfxp-sound-361.wav", ",", "473059__erokia__msfxp-sound-362.wav", ",", "473060__erokia__msfxp-sound-363.wav", ",", "473061__erokia__msfxp-sound-364.wav", ",", "473062__erokia__msfxp-sound-365.wav", ",", "473063__erokia__msfxp-sound-366.wav", ",", "473064__erokia__msfxp-sound-367.wav", ",", "473065__erokia__msfxp-sound-273.wav", ",", "473066__erokia__msfxp-sound-272.wav", ",", "473067__erokia__msfxp-sound-271.wav", ",", "473068__erokia__msfxp-sound-270.wav", ",", "473069__erokia__msfxp-sound-277.wav", ",", "473070__erokia__msfxp-sound-276.wav", ",", "473071__erokia__msfxp-sound-275.wav", ",", "473072__erokia__msfxp-sound-274.wav", ",", "473073__erokia__msfxp-sound-279.wav", ",", "473074__erokia__msfxp-sound-278.wav", ",", "473075__erokia__msfxp-sound-10.wav", ",", "473076__erokia__msfxp-sound-1.wav", ",", "473077__erokia__msfxp-sound-92.wav", ",", "473078__erokia__msfxp-sound-93.wav", ",", "473079__erokia__msfxp-sound-492.wav", ",", "473080__erokia__msfxp-sound-491.wav", ",", "473081__erokia__msfxp-sound-88.wav", ",", "473082__erokia__msfxp-sound-9.wav", ",", "473083__erokia__msfxp-sound-90.wav", ",", "473084__erokia__msfxp-sound-91.wav", ",", "473085__erokia__msfxp-sound-487.wav", ",", "473088__erokia__msfxp-sound-486.wav", ",", "473089__erokia__msfxp-sound-485.wav", ",", "473090__erokia__msfxp-sound-484.wav", ",", "473091__erokia__msfxp-sound-490.wav", ",", "473092__erokia__msfxp-sound-49.wav", ",", "473093__erokia__msfxp-sound-489.wav", ",", "473094__erokia__msfxp-sound-488.wav", ",", "473095__erokia__msfxp-sound-107.wav", ",", "473096__erokia__msfxp-sound-106.wav", ",", "473097__erokia__msfxp-sound-388.wav", ",", "473098__erokia__msfxp-sound-389.wav", ",", "473099__erokia__msfxp-sound-39.wav", ",", "473100__erokia__msfxp-sound-390.wav", ",", "473101__erokia__msfxp-sound-391.wav", ",", "473102__erokia__msfxp-sound-392.wav", ",", "473103__erokia__msfxp-sound-393.wav", ",", "473104__erokia__msfxp-sound-394.wav", ",", "473105__erokia__msfxp-sound-395.wav", ",", "473106__erokia__msfxp-sound-396.wav", ",", "473107__erokia__msfxp-sound-560.wav", ",", "473108__erokia__msfxp-sound-549.wav", ",", "473109__erokia__msfxp-sound-548.wav", ",", "473110__erokia__msfxp-sound-547.wav", ",", "473111__erokia__msfxp-sound-537.wav", ",", "473112__erokia__msfxp-sound-552.wav", ",", "473113__erokia__msfxp-sound-551.wav", ",", "473114__erokia__msfxp-sound-550.wav", ",", "473115__erokia__msfxp-sound-55.wav", ",", "473116__erokia__msfxp-sound-417.wav", ",", "473117__erokia__msfxp-sound-418.wav", ",", "473118__erokia__msfxp-sound-554.wav", ",", "473119__erokia__msfxp-sound-553.wav", ",", "473120__erokia__msfxp-sound-420.wav", ",", "473121__erokia__msfxp-sound-421.wav", ",", "473122__erokia__msfxp-sound-419.wav", ",", "473123__erokia__msfxp-sound-42.wav", ",", "473124__erokia__msfxp-sound-156.wav", ",", "473125__erokia__msfxp-sound-155.wav", ",", "473126__erokia__msfxp-sound-149.wav", ",", "473127__erokia__msfxp-sound-148.wav", ",", "473128__erokia__msfxp-sound-150.wav", ",", "473129__erokia__msfxp-sound-15.wav", ",", "473130__erokia__msfxp-sound-152.wav", ",", "473131__erokia__msfxp-sound-151.wav", ",", "473132__erokia__msfxp-sound-154.wav", ",", "473133__erokia__msfxp-sound-153.wav", ",", "473134__erokia__msfxp-sound-441.wav", ",", "473135__erokia__msfxp-sound-440.wav", ",", "473136__erokia__msfxp-sound-44.wav", ",", "473137__erokia__msfxp-sound-439.wav", ",", "473146__erokia__msfxp-sound-585.wav", ",", "473147__erokia__msfxp-sound-584.wav", ",", "473148__erokia__msfxp-sound-583.wav", ",", "473149__erokia__msfxp-sound-582.wav", ",", "473150__erokia__msfxp-sound-589.wav", ",", "473151__erokia__msfxp-sound-588.wav", ",", "473152__erokia__msfxp-sound-587.wav", ",", "473153__erokia__msfxp-sound-586.wav", ",", "473154__erokia__msfxp-sound-444.wav", ",", "473155__erokia__msfxp-sound-445.wav", ",", "473156__erokia__msfxp-sound-590.wav", ",", "473157__erokia__msfxp-sound-59.wav", ",", "473158__erokia__msfxp-sound-448.wav", ",", "473159__erokia__msfxp-sound-449.wav", ",", "473160__erokia__msfxp-sound-446.wav", ",", "473161__erokia__msfxp-sound-447.wav", ",", "473162__erokia__msfxp-sound-165.wav", ",", "473163__erokia__msfxp-sound-164.wav", ",", "473164__erokia__msfxp-sound-158.wav", ",", "473165__erokia__msfxp-sound-157.wav", ",", "473166__erokia__msfxp-sound-16.wav", ",", "473167__erokia__msfxp-sound-159.wav", ",", "473168__erokia__msfxp-sound-161.wav", ",", "473169__erokia__msfxp-sound-160.wav", ",", "473170__erokia__msfxp-sound-163.wav", ",", "473171__erokia__msfxp-sound-162.wav", ",", "473172__erokia__msfxp-sound-461.wav", ",", "473173__erokia__msfxp-sound-460.wav", ",", "473174__erokia__msfxp-sound-46.wav", ",", "473175__erokia__msfxp-sound-459.wav", ",", "473176__erokia__msfxp-sound-456.wav", ",", "473177__erokia__msfxp-sound-455.wav", ",", "473178__erokia__msfxp-sound-454.wav", ",", "473179__erokia__msfxp-sound-453.wav", ",", "473180__erokia__msfxp-sound-452.wav", ",", "473181__erokia__msfxp-sound-451.wav", ",", "473182__erokia__msfxp-sound-296.wav", ",", "473183__erokia__msfxp-sound-297.wav", ",", "473184__erokia__msfxp-sound-298.wav", ",", "473185__erokia__msfxp-sound-299.wav", ",", "473186__erokia__msfxp-sound-292.wav", ",", "473187__erokia__msfxp-sound-293.wav", ",", "473188__erokia__msfxp-sound-294.wav", ",", "473189__erokia__msfxp-sound-295.wav", ",", "473190__erokia__msfxp-sound-3.wav", ",", "473191__erokia__msfxp-sound-30.wav", ",", "473192__erokia__msfxp-sound-376.wav", ",", "473193__erokia__msfxp-sound-375.wav", ",", "473194__erokia__msfxp-sound-374.wav", ",", "473195__erokia__msfxp-sound-373.wav", ",", "473196__erokia__msfxp-sound-38.wav", ",", "473197__erokia__msfxp-sound-379.wav", ",", "473198__erokia__msfxp-sound-378.wav", ",", "473199__erokia__msfxp-sound-377.wav", ",", "473200__erokia__msfxp-sound-381.wav", ",", "473201__erokia__msfxp-sound-380.wav", ",", "473202__erokia__msfxp-sound-45.wav", ",", "473203__erokia__msfxp-sound-450.wav", ",", "473204__erokia__msfxp-sound-95.wav", ",", "473205__erokia__msfxp-sound-97.wav", ",", "473206__erokia__msfxp-sound-85.wav", ",", "473207__erokia__msfxp-sound-86.wav", ",", "473208__erokia__msfxp-sound-87.wav", ",", "473209__erokia__msfxp-sound-94.wav", ",", "473210__erokia__msfxp-sound-81.wav", ",", "473211__erokia__msfxp-sound-82.wav", ",", "473212__erokia__msfxp-sound-83.wav", ",", "473213__erokia__msfxp-sound-84.wav", ",", "473214__erokia__msfxp-sound-166.wav", ",", "473215__erokia__msfxp-sound-167.wav", ",", "473216__erokia__msfxp-sound-168.wav", ",", "473217__erokia__msfxp-sound-169.wav", ",", "473218__erokia__msfxp-sound-17.wav", ",", "473219__erokia__msfxp-sound-170.wav", ",", "473220__erokia__msfxp-sound-171.wav", ",", "473221__erokia__msfxp-sound-172.wav", ",", "473222__erokia__msfxp-sound-173.wav", ",", "473223__erokia__msfxp-sound-174.wav", ",", "473224__erokia__msfxp-sound-442.wav", ",", "473225__erokia__msfxp-sound-443.wav", ",", "473226__erokia__msfxp-sound-245.wav", ",", "473227__erokia__msfxp-sound-246.wav", ",", "473228__erokia__msfxp-sound-238.wav", ",", "473229__erokia__msfxp-sound-239.wav", ",", "473230__erokia__msfxp-sound-24.wav", ",", "473231__erokia__msfxp-sound-240.wav", ",", "473232__erokia__msfxp-sound-241.wav", ",", "473233__erokia__msfxp-sound-242.wav", ",", "473234__erokia__msfxp-sound-243.wav", ",", "473235__erokia__msfxp-sound-244.wav", ",", "473236__erokia__msfxp-sound-519.wav", ",", "473237__erokia__msfxp-sound-526.wav", ",", "473238__erokia__msfxp-sound-511.wav", ",", "473239__erokia__msfxp-sound-512.wav", ",", "473240__erokia__msfxp-sound-513.wav", ",", "473241__erokia__msfxp-sound-514.wav", ",", "473242__erokia__msfxp-sound-515.wav", ",", "473243__erokia__msfxp-sound-516.wav", ",", "473244__erokia__msfxp-sound-517.wav", ",", "473245__erokia__msfxp-sound-518.wav", ",", "473246__erokia__msfxp-sound-358.wav", ",", "473247__erokia__msfxp-sound-357.wav", ",", "473248__erokia__msfxp-sound-356.wav", ",", "473249__erokia__msfxp-sound-355.wav", ",", "473250__erokia__msfxp-sound-370.wav", ",", "473251__erokia__msfxp-sound-37.wav", ",", "473252__erokia__msfxp-sound-36.wav", ",", "473253__erokia__msfxp-sound-359.wav", ",", "473254__erokia__msfxp-sound-372.wav", ",", "473255__erokia__msfxp-sound-371.wav", ",", "473256__erokia__msfxp-sound-101.wav", ",", "473257__erokia__msfxp-sound-100.wav", ",", "473258__erokia__msfxp-sound-110.wav", ",", "473259__erokia__msfxp-sound-11.wav", ",", "473260__erokia__msfxp-sound-566.wav", ",", "473261__erokia__msfxp-sound-567.wav", ",", "473262__erokia__msfxp-sound-568.wav", ",", "473263__erokia__msfxp-sound-569.wav", ",", "473264__erokia__msfxp-sound-57.wav", ",", "473265__erokia__msfxp-sound-570.wav", ",", "473266__erokia__msfxp-sound-571.wav", ",", "473267__erokia__msfxp-sound-576.wav", ",", "473268__erokia__msfxp-sound-577.wav", ",", "473269__erokia__msfxp-sound-581.wav", ",", "473270__erokia__msfxp-sound-471.wav", ",", "473271__erokia__msfxp-sound-472.wav", ",", "473272__erokia__msfxp-sound-468.wav", ",", "473273__erokia__msfxp-sound-469.wav", ",", "473274__erokia__msfxp-sound-47.wav", ",", "473275__erokia__msfxp-sound-470.wav", ",", "473276__erokia__msfxp-sound-462.wav", ",", "473277__erokia__msfxp-sound-463.wav", ",", "473278__erokia__msfxp-sound-466.wav", ",", "473279__erokia__msfxp-sound-467.wav", ",", "473280__erokia__msfxp-sound-338.wav", ",", "473281__erokia__msfxp-sound-337.wav", ",", "473282__erokia__msfxp-sound-34.wav", ",", "473283__erokia__msfxp-sound-339.wav", ",", "473284__erokia__msfxp-sound-341.wav", ",", "473285__erokia__msfxp-sound-340.wav", ",", "473286__erokia__msfxp-sound-343.wav", ",", "473287__erokia__msfxp-sound-342.wav", ",", "473288__erokia__msfxp-sound-345.wav", ",", "473289__erokia__msfxp-sound-344.wav", ",", "473290__erokia__msfxp-sound-382.wav", ",", "473291__erokia__msfxp-sound-383.wav", ",", "473292__erokia__msfxp-sound-384.wav", ",", "473293__erokia__msfxp-sound-385.wav", ",", "473294__erokia__msfxp-sound-386.wav", ",", "473295__erokia__msfxp-sound-387.wav", ",", "473296__erokia__msfxp-sound-411.wav", ",", "473297__erokia__msfxp-sound-412.wav", ",", "473298__erokia__msfxp-sound-413.wav", ",", "473299__erokia__msfxp-sound-414.wav", ",", "473300__erokia__msfxp-sound-80.wav", ",", "473301__erokia__msfxp-sound-8.wav", ",", "473302__erokia__msfxp-sound-62.wav", ",", "473303__erokia__msfxp-sound-60.wav", ",", "473304__erokia__msfxp-sound-64.wav", ",", "473305__erokia__msfxp-sound-63.wav", ",", "473306__erokia__msfxp-sound-66.wav", ",", "473307__erokia__msfxp-sound-65.wav", ",", "473308__erokia__msfxp-sound-79.wav", ",", "473309__erokia__msfxp-sound-67.wav", ",", "473310__erokia__msfxp-sound-183.wav", ",", "473311__erokia__msfxp-sound-182.wav", ",", "473312__erokia__msfxp-sound-181.wav", ",", "473313__erokia__msfxp-sound-180.wav", ",", "473314__erokia__msfxp-sound-18.wav", ",", "473315__erokia__msfxp-sound-179.wav", ",", "473316__erokia__msfxp-sound-178.wav", ",", "473317__erokia__msfxp-sound-177.wav", ",", "473318__erokia__msfxp-sound-176.wav", ",", "473319__erokia__msfxp-sound-175.wav", ",", "473320__erokia__msfxp-sound-27.wav", ",", "473321__erokia__msfxp-sound-269.wav", ",", "473322__erokia__msfxp-sound-29.wav", ",", "473323__erokia__msfxp-sound-289.wav", ",", "473324__erokia__msfxp-sound-266.wav", ",", "473325__erokia__msfxp-sound-265.wav", ",", "473326__erokia__msfxp-sound-268.wav", ",", "473327__erokia__msfxp-sound-267.wav", ",", "473328__erokia__msfxp-sound-291.wav", ",", "473329__erokia__msfxp-sound-290.wav", ",", "473330__erokia__msfxp-sound-593.wav", ",", "473331__erokia__msfxp-sound-594.wav", ",", "473332__erokia__msfxp-sound-346.wav", ",", "473333__erokia__msfxp-sound-347.wav", ",", "473334__erokia__msfxp-sound-348.wav", ",", "473335__erokia__msfxp-sound-349.wav", ",", "473336__erokia__msfxp-sound-35.wav", ",", "473337__erokia__msfxp-sound-350.wav", ",", "473338__erokia__msfxp-sound-351.wav", ",", "473339__erokia__msfxp-sound-352.wav", ",", "473340__erokia__msfxp-sound-353.wav", ",", "473341__erokia__msfxp-sound-354.wav", ",", "473342__erokia__msfxp-sound-599.wav", ",", "473343__erokia__msfxp-sound-6.wav", ",", "473344__erokia__msfxp-sound-218.wav", ",", "473345__erokia__msfxp-sound-219.wav", ",", "473346__erokia__msfxp-sound-214.wav", ",", "473347__erokia__msfxp-sound-215.wav", ",", "473348__erokia__msfxp-sound-216.wav", ",", "473349__erokia__msfxp-sound-217.wav", ",", "473350__erokia__msfxp-sound-210.wav", ",", "473351__erokia__msfxp-sound-211.wav", ",", "473352__erokia__msfxp-sound-212.wav", ",", "473353__erokia__msfxp-sound-213.wav", ",", "473354__erokia__msfxp-sound-565.wav", ",", "473355__erokia__msfxp-sound-564.wav", ",", "473356__erokia__msfxp-sound-561.wav", ",", "473357__erokia__msfxp-sound-56.wav", ",", "473358__erokia__msfxp-sound-563.wav", ",", "473359__erokia__msfxp-sound-562.wav", ",", "473360__erokia__msfxp-sound-556.wav", ",", "473361__erokia__msfxp-sound-555.wav", ",", "473362__erokia__msfxp-sound-558.wav", ",", "473363__erokia__msfxp-sound-557.wav", ",", "473364__erokia__msfxp-sound-114.wav", ",", "473365__erokia__msfxp-sound-113.wav", ",", "473366__erokia__msfxp-sound-112.wav", ",", "473367__erokia__msfxp-sound-111.wav", ",", "473368__erokia__msfxp-sound-118.wav", ",", "473369__erokia__msfxp-sound-117.wav", ",", "473370__erokia__msfxp-sound-116.wav", ",", "473371__erokia__msfxp-sound-115.wav", ",", "473372__erokia__msfxp-sound-12.wav", ",", "473373__erokia__msfxp-sound-119.wav", ",", "473374__erokia__msfxp-sound-493.wav", ",", "473375__erokia__msfxp-sound-481.wav", ",", "473376__erokia__msfxp-sound-475.wav", ",", "473377__erokia__msfxp-sound-474.wav", ",", "473378__erokia__msfxp-sound-477.wav", ",", "473379__erokia__msfxp-sound-476.wav", ",", "473380__erokia__msfxp-sound-479.wav", ",", "473381__erokia__msfxp-sound-478.wav", ",", "473382__erokia__msfxp-sound-480.wav", ",", "473383__erokia__msfxp-sound-48.wav", ",", "473384__erokia__msfxp-sound-199.wav", ",", "473385__erokia__msfxp-sound-2.wav", ",", "473386__erokia__msfxp-sound-188.wav", ",", "473387__erokia__msfxp-sound-189.wav", ",", "473388__erokia__msfxp-sound-186.wav", ",", "473389__erokia__msfxp-sound-187.wav", ",", "473390__erokia__msfxp-sound-184.wav", ",", "473391__erokia__msfxp-sound-185.wav", ",", "473392__erokia__msfxp-sound-20.wav", ",", "473393__erokia__msfxp-sound-200.wav", ",", "473394__erokia__msfxp-sound-335.wav", ",", "473395__erokia__msfxp-sound-336.wav", ",", "473396__erokia__msfxp-sound-333.wav", ",", "473397__erokia__msfxp-sound-334.wav", ",", "473398__erokia__msfxp-sound-331.wav", ",", "473399__erokia__msfxp-sound-332.wav", ",", "473400__erokia__msfxp-sound-33.wav", ",", "473401__erokia__msfxp-sound-330.wav", ",", "473402__erokia__msfxp-sound-328.wav", ",", "473403__erokia__msfxp-sound-329.wav", ",", "473404__erokia__msfxp-sound-597.wav", ",", "473405__erokia__msfxp-sound-598.wav", ",", "473406__erokia__msfxp-sound-595.wav", ",", "473407__erokia__msfxp-sound-596.wav", ",", "473408__erokia__msfxp-sound-429.wav", ",", "473409__erokia__msfxp-sound-428.wav", ",", "473410__erokia__msfxp-sound-591.wav", ",", "473411__erokia__msfxp-sound-592.wav", ",", "473412__erokia__msfxp-sound-425.wav", ",", "473413__erokia__msfxp-sound-424.wav", ",", "473414__erokia__msfxp-sound-427.wav", ",", "473415__erokia__msfxp-sound-426.wav", ",", "473416__erokia__msfxp-sound-416.wav", ",", "473417__erokia__msfxp-sound-415.wav", ",", "473418__erokia__msfxp-sound-423.wav", ",", "473419__erokia__msfxp-sound-422.wav", ",", "473420__erokia__msfxp-sound-146.wav", ",", "473421__erokia__msfxp-sound-147.wav", ",", "473422__erokia__msfxp-sound-122.wav", ",", "473423__erokia__msfxp-sound-123.wav", ",", "473424__erokia__msfxp-sound-120.wav", ",", "473425__erokia__msfxp-sound-121.wav", ",", "473426__erokia__msfxp-sound-144.wav", ",", "473427__erokia__msfxp-sound-145.wav", ",", "473428__erokia__msfxp-sound-124.wav", ",", "473429__erokia__msfxp-sound-125.wav", ",", "473430__erokia__msfxp-sound-258.wav", ",", "473431__erokia__msfxp-sound-259.wav", ",", "473432__erokia__msfxp-sound-256.wav", ",", "473433__erokia__msfxp-sound-257.wav", ",", "473434__erokia__msfxp-sound-261.wav", ",", "473435__erokia__msfxp-sound-262.wav", ",", "473436__erokia__msfxp-sound-26.wav", ",", "473437__erokia__msfxp-sound-260.wav", ",", "473438__erokia__msfxp-sound-263.wav", ",", "473439__erokia__msfxp-sound-264.wav", ",", "473440__erokia__msfxp-sound-325.wav", ",", "473441__erokia__msfxp-sound-324.wav", ",", "473442__erokia__msfxp-sound-305.wav", ",", "473443__erokia__msfxp-sound-304.wav", ",", "473444__erokia__msfxp-sound-303.wav", ",", "473445__erokia__msfxp-sound-302.wav", ",", "473446__erokia__msfxp-sound-301.wav", ",", "473447__erokia__msfxp-sound-300.wav", ",", "473448__erokia__msfxp-sound-327.wav", ",", "473449__erokia__msfxp-sound-326.wav", ",", "473450__erokia__msfxp-sound-237.wav", ",", "473451__erokia__msfxp-sound-236.wav", ",", "473452__erokia__msfxp-sound-222.wav", ",", "473453__erokia__msfxp-sound-221.wav", ",", "473454__erokia__msfxp-sound-220.wav", ",", "473455__erokia__msfxp-sound-22.wav", ",", "473456__erokia__msfxp-sound-235.wav", ",", "473457__erokia__msfxp-sound-234.wav", ",", "473458__erokia__msfxp-sound-224.wav", ",", "473459__erokia__msfxp-sound-223.wav", ",", "473460__erokia__msfxp-sound-103.wav", ",", "473461__erokia__msfxp-sound-102.wav", ",", "473462__erokia__msfxp-sound-535.wav", ",", "473463__erokia__msfxp-sound-536.wav", ",", "473464__erokia__msfxp-sound-109.wav", ",", "473465__erokia__msfxp-sound-108.wav", ",", "473466__erokia__msfxp-sound-105.wav", ",", "473467__erokia__msfxp-sound-104.wav", ",", "473468__erokia__msfxp-sound-53.wav", ",", "473469__erokia__msfxp-sound-530.wav", ",", "473470__erokia__msfxp-sound-527.wav", ",", "473471__erokia__msfxp-sound-529.wav", ",", "473472__erokia__msfxp-sound-533.wav", ",", "473473__erokia__msfxp-sound-534.wav", ",", "473474__erokia__msfxp-sound-531.wav", ",", "473475__erokia__msfxp-sound-532.wav", ",", "473476__erokia__msfxp-sound-5.wav", ",", "473477__erokia__msfxp-sound-50.wav", ",", "473478__erokia__msfxp-sound-498.wav", ",", "473479__erokia__msfxp-sound-499.wav", ",", "473480__erokia__msfxp-sound-496.wav", ",", "473481__erokia__msfxp-sound-497.wav", ",", "473482__erokia__msfxp-sound-494.wav", ",", "473483__erokia__msfxp-sound-495.wav", ",", "473484__erokia__msfxp-sound-500.wav", ",", "473485__erokia__msfxp-sound-501.wav", ",", "473486__erokia__msfxp-sound-99.wav", ",", "473487__erokia__msfxp-sound-98.wav", ",", "473488__erokia__msfxp-sound-206.wav", ",", "473489__erokia__msfxp-sound-205.wav", ",", "473490__erokia__msfxp-sound-208.wav", ",", "473491__erokia__msfxp-sound-207.wav", ",", "473492__erokia__msfxp-sound-202.wav", ",", "473493__erokia__msfxp-sound-201.wav", ",", "473494__erokia__msfxp-sound-204.wav", ",", "473495__erokia__msfxp-sound-203.wav", ",", "473496__erokia__msfxp-sound-21.wav", ",", "473497__erokia__msfxp-sound-209.wav", ",", "473498__erokia__msfxp-sound-255.wav", ",", "473499__erokia__msfxp-sound-254.wav", ",", "473500__erokia__msfxp-sound-25.wav", ",", "473501__erokia__msfxp-sound-249.wav", ",", "473502__erokia__msfxp-sound-248.wav", ",", "473503__erokia__msfxp-sound-247.wav", ",", "473504__erokia__msfxp-sound-253.wav", ",", "473505__erokia__msfxp-sound-252.wav", ",", "473506__erokia__msfxp-sound-251.wav", ",", "473507__erokia__msfxp-sound-250.wav", ",", "473508__erokia__msfxp-sound-510.wav", ",", "473509__erokia__msfxp-sound-51.wav", ",", "473510__erokia__msfxp-sound-505.wav", ",", "473511__erokia__msfxp-sound-504.wav", ",", "473512__erokia__msfxp-sound-503.wav", ",", "473513__erokia__msfxp-sound-502.wav", ",", "473514__erokia__msfxp-sound-509.wav", ",", "473515__erokia__msfxp-sound-508.wav", ",", "473516__erokia__msfxp-sound-507.wav", ",", "473517__erokia__msfxp-sound-506.wav", ",", "476940__erokia__msfxp2-175.wav", ",", "477332__erokia__msfxp2-192.wav", ",", "477374__erokia__msfxp2-205.wav", ",", "478084__erokia__msfxp2-222.wav", ",", "478297__erokia__msfxp2-314.wav", ",", "478529__erokia__msfxp2-351-4-two-variations-of-the-same-pattern.wav", ",", "478548__erokia__msfxp2-264.wav", ",", "478575__erokia__msfxp2-387.wav", ",", "479319__erokia__msfxp2-199.wav", ",", "479440__erokia__msfxp2-183-5.wav", ",", "479744__erokia__msfxp2-267.wav", ",", "480936__erokia__msfxp2-32.wav", ",", "480937__erokia__msfxp2-33.wav", ",", "480938__erokia__msfxp2-27.wav", ",", "480939__erokia__msfxp2-28.wav", ",", "480940__erokia__msfxp2-25.wav", ",", "480941__erokia__msfxp2-26.wav", ",", "480942__erokia__msfxp2-30.wav", ",", "480943__erokia__msfxp2-31.wav", ",", "480944__erokia__msfxp2-29.wav", ",", "480945__erokia__msfxp2-3.wav", ",", "480946__erokia__msfxp2-42.wav", ",", "480947__erokia__msfxp2-41.wav", ",", "480948__erokia__msfxp2-35.wav", ",", "480949__erokia__msfxp2-34.wav", ",", "480950__erokia__msfxp2-37.wav", ",", "480951__erokia__msfxp2-36.wav", ",", "480952__erokia__msfxp2-39.wav", ",", "480953__erokia__msfxp2-38.wav", ",", "480954__erokia__msfxp2-40.wav", ",", "480955__erokia__msfxp2-4.wav", ",", "480956__erokia__msfxp2-85.wav", ",", "480957__erokia__msfxp2-86.wav", ",", "480958__erokia__msfxp2-81.wav", ",", "480959__erokia__msfxp2-82.wav", ",", "480960__erokia__msfxp2-83.wav", ",", "480961__erokia__msfxp2-84.wav", ",", "480962__erokia__msfxp2-78.wav", ",", "480963__erokia__msfxp2-79.wav", ",", "480964__erokia__msfxp2-8.wav", ",", "480965__erokia__msfxp2-80.wav", ",", "480966__erokia__msfxp2-94.wav", ",", "480967__erokia__msfxp2-93-2.wav", ",", "480968__erokia__msfxp2-9.wav", ",", "480969__erokia__msfxp2-89.wav", ",", "480970__erokia__msfxp2-88.wav", ",", "480971__erokia__msfxp2-87.wav", ",", "480972__erokia__msfxp2-93.wav", ",", "480973__erokia__msfxp2-92.wav", ",", "480974__erokia__msfxp2-91.wav", ",", "480975__erokia__msfxp2-90.wav", ",", "480976__erokia__msfxp2-195.wav", ",", "480977__erokia__msfxp2-19.wav", ",", "480978__erokia__msfxp2-18.wav", ",", "480979__erokia__msfxp2-22.wav", ",", "480980__erokia__msfxp2-21.wav", ",", "480981__erokia__msfxp2-20.wav", ",", "480982__erokia__msfxp2-2.wav", ",", "480983__erokia__msfxp2-24.wav", ",", "480984__erokia__msfxp2-23.wav", ",", "480985__erokia__msfxp2-11.wav", ",", "480986__erokia__msfxp2-100.wav", ",", "480987__erokia__msfxp2-10.wav", ",", "480988__erokia__msfxp2-1.wav", ",", "480989__erokia__msfxp2-15.wav", ",", "480990__erokia__msfxp2-14.wav", ",", "480991__erokia__msfxp2-13.wav", ",", "480992__erokia__msfxp2-12.wav", ",", "480993__erokia__msfxp2-17.wav", ",", "480994__erokia__msfxp2-16.wav", ",", "480995__erokia__msfxp2-67.wav", ",", "480996__erokia__msfxp2-68.wav", ",", "480997__erokia__msfxp2-65.wav", ",", "480998__erokia__msfxp2-66.wav", ",", "480999__erokia__msfxp2-63.wav", ",", "481000__erokia__msfxp2-64.wav", ",", "481001__erokia__msfxp2-61.wav", ",", "481002__erokia__msfxp2-62.wav", ",", "481003__erokia__msfxp2-69.wav", ",", "481004__erokia__msfxp2-7.wav", ",", "481005__erokia__msfxp2-74.wav", ",", "481006__erokia__msfxp2-73.wav", ",", "481007__erokia__msfxp2-75-2.wav", ",", "481008__erokia__msfxp2-75.wav", ",", "481009__erokia__msfxp2-70-2.wav", ",", "481010__erokia__msfxp2-70.wav", ",", "481011__erokia__msfxp2-72.wav", ",", "481012__erokia__msfxp2-71.wav", ",", "481013__erokia__msfxp2-77.wav", ",", "481014__erokia__msfxp2-76.wav", ",", "481015__erokia__msfxp2-43.wav", ",", "481016__erokia__msfxp2-44.wav", ",", "481017__erokia__msfxp2-45.wav", ",", "481018__erokia__msfxp2-46.wav", ",", "481019__erokia__msfxp2-47.wav", ",", "481020__erokia__msfxp2-48.wav", ",", "481021__erokia__msfxp2-49.wav", ",", "481022__erokia__msfxp2-5.wav", ",", "481023__erokia__msfxp2-50.wav", ",", "481024__erokia__msfxp2-51.wav", ",", "481025__erokia__msfxp2-95.wav", ",", "481026__erokia__msfxp2-96.wav", ",", "481027__erokia__msfxp2-97.wav", ",", "481028__erokia__msfxp2-98.wav", ",", "481029__erokia__msfxp2-99.wav", ",", "481030__erokia__msfxp2-60.wav", ",", "481031__erokia__msfxp2-6.wav", ",", "481032__erokia__msfxp2-59.wav", ",", "481033__erokia__msfxp2-58.wav", ",", "481034__erokia__msfxp2-57.wav", ",", "481035__erokia__msfxp2-56.wav", ",", "481036__erokia__msfxp2-55.wav", ",", "481037__erokia__msfxp2-54.wav", ",", "481038__erokia__msfxp2-53.wav", ",", "481039__erokia__msfxp2-52.wav", ",", "481138__erokia__msfxp2-420.wav", ",", "481152__erokia__msfxp2-218.wav", ",", "481153__erokia__msfxp2-217.wav", ",", "481154__erokia__msfxp2-220.wav", ",", "481155__erokia__msfxp2-219.wav", ",", "481156__erokia__msfxp2-214.wav", ",", "481157__erokia__msfxp2-213.wav", ",", "481158__erokia__msfxp2-216.wav", ",", "481159__erokia__msfxp2-215.wav", ",", "481160__erokia__msfxp2-284.wav", ",", "481161__erokia__msfxp2-283.wav", ",", "481162__erokia__msfxp2-285.wav", ",", "481163__erokia__msfxp2-284-2.wav", ",", "481164__erokia__msfxp2-221.wav", ",", "481165__erokia__msfxp2-282-3.wav", ",", "481166__erokia__msfxp2-282-2.wav", ",", "481167__erokia__msfxp2-287.wav", ",", "481168__erokia__msfxp2-286.wav", ",", "481169__erokia__msfxp2-405.wav", ",", "481170__erokia__msfxp2-250-3.wav", ",", "481171__erokia__msfxp2-250-4.wav", ",", "481172__erokia__msfxp2-124.wav", ",", "481173__erokia__msfxp2-125.wav", ",", "481174__erokia__msfxp2-252.wav", ",", "481175__erokia__msfxp2-253.wav", ",", "481176__erokia__msfxp2-254.wav", ",", "481177__erokia__msfxp2-255.wav", ",", "481178__erokia__msfxp2-119-3.wav", ",", "481179__erokia__msfxp2-120.wav", ",", "481180__erokia__msfxp2-119.wav", ",", "481181__erokia__msfxp2-119-2.wav", ",", "481182__erokia__msfxp2-122-2.wav", ",", "481183__erokia__msfxp2-123.wav", ",", "481184__erokia__msfxp2-121.wav", ",", "481185__erokia__msfxp2-122.wav", ",", "481186__erokia__msfxp2-207.wav", ",", "481187__erokia__msfxp2-208.wav", ",", "481188__erokia__msfxp2-206.wav", ",", "481189__erokia__msfxp2-210.wav", ",", "481190__erokia__msfxp2-210-2.wav", ",", "481191__erokia__msfxp2-209.wav", ",", "481192__erokia__msfxp2-209-2.wav", ",", "481193__erokia__msfxp2-290.wav", ",", "481194__erokia__msfxp2-282.wav", ",", "481195__erokia__msfxp2-211.wav", ",", "481196__erokia__msfxp2-212.wav", ",", "481197__erokia__msfxp2-294.wav", ",", "481198__erokia__msfxp2-294-2.wav", ",", "481199__erokia__msfxp2-292.wav", ",", "481204__erokia__msfxp2-281.wav", ",", "481205__erokia__msfxp2-411-2.wav", ",", "481206__erokia__msfxp2-257.wav", ",", "481207__erokia__msfxp2-400-3.wav", ",", "481208__erokia__msfxp2-406-2.wav", ",", "481209__erokia__msfxp2-415.wav", ",", "481210__erokia__msfxp2-414-2.wav", ",", "481211__erokia__msfxp2-131.wav", ",", "481212__erokia__msfxp2-130.wav", ",", "481213__erokia__msfxp2-125-3.wav", ",", "481214__erokia__msfxp2-125-2.wav", ",", "481215__erokia__msfxp2-127.wav", ",", "481216__erokia__msfxp2-126.wav", ",", "481217__erokia__msfxp2-128-2.wav", ",", "481218__erokia__msfxp2-128.wav", ",", "481219__erokia__msfxp2-129-2.wav", ",", "481220__erokia__msfxp2-129.wav", ",", "481221__erokia__msfxp2-233.wav", ",", "481222__erokia__msfxp2-232-3.wav", ",", "481223__erokia__msfxp2-232-2.wav", ",", "481224__erokia__msfxp2-232.wav", ",", "481225__erokia__msfxp2-179.wav", ",", "481226__erokia__msfxp2-180.wav", ",", "481227__erokia__msfxp2-230.wav", ",", "481228__erokia__msfxp2-229.wav", ",", "481229__erokia__msfxp2-176.wav", ",", "481230__erokia__msfxp2-177.wav", ",", "481231__erokia__msfxp2-178.wav", ",", "481232__erokia__msfxp2-171.wav", ",", "481233__erokia__msfxp2-172.wav", ",", "481234__erokia__msfxp2-173.wav", ",", "481235__erokia__msfxp2-174.wav", ",", "481236__erokia__msfxp2-264-2.wav", ",", "481237__erokia__msfxp2-235.wav", ",", "481238__erokia__msfxp2-413.wav", ",", "481239__erokia__msfxp2-411-3.wav", ",", "481240__erokia__msfxp2-293.wav", ",", "481241__erokia__msfxp2-298.wav", ",", "481242__erokia__msfxp2-225-2.wav", ",", "481243__erokia__msfxp2-225-3.wav", ",", "481244__erokia__msfxp2-184.wav", ",", "481245__erokia__msfxp2-222-2.wav", ",", "481246__erokia__msfxp2-223.wav", ",", "481247__erokia__msfxp2-224.wav", ",", "481248__erokia__msfxp2-225.wav", ",", "481249__erokia__msfxp2-182-2.wav", ",", "481250__erokia__msfxp2-182.wav", ",", "481251__erokia__msfxp2-181-2.wav", ",", "481252__erokia__msfxp2-181.wav", ",", "481253__erokia__msfxp2-183-4.wav", ",", "481254__erokia__msfxp2-183-3.wav", ",", "481255__erokia__msfxp2-183-2.wav", ",", "481256__erokia__msfxp2-183.wav", ",", "481257__erokia__msfxp2-112.wav", ",", "481258__erokia__msfxp2-111.wav", ",", "481259__erokia__msfxp2-110.wav", ",", "481260__erokia__msfxp2-109.wav", ",", "481261__erokia__msfxp2-116.wav", ",", "481262__erokia__msfxp2-115.wav", ",", "481263__erokia__msfxp2-114.wav", ",", "481264__erokia__msfxp2-113.wav", ",", "481265__erokia__msfxp2-118.wav", ",", "481266__erokia__msfxp2-117.wav", ",", "481267__erokia__msfxp2-297.wav", ",", "481268__erokia__msfxp2-225-4.wav", ",", "481269__erokia__msfxp2-226.wav", ",", "481270__erokia__msfxp2-410.wav", ",", "481271__erokia__msfxp2-406.wav", ",", "481272__erokia__msfxp2-411.wav", ",", "481273__erokia__msfxp2-102.wav", ",", "481274__erokia__msfxp2-101.wav", ",", "481275__erokia__msfxp2-100-3.wav", ",", "481276__erokia__msfxp2-100-2.wav", ",", "481277__erokia__msfxp2-106.wav", ",", "481278__erokia__msfxp2-105.wav", ",", "481279__erokia__msfxp2-104.wav", ",", "481280__erokia__msfxp2-103.wav", ",", "481281__erokia__msfxp2-108.wav", ",", "481282__erokia__msfxp2-107.wav", ",", "481283__erokia__msfxp2-243.wav", ",", "481284__erokia__msfxp2-242.wav", ",", "481285__erokia__msfxp2-245.wav", ",", "481286__erokia__msfxp2-244.wav", ",", "481287__erokia__msfxp2-247.wav", ",", "481288__erokia__msfxp2-246.wav", ",", "481289__erokia__msfxp2-249.wav", ",", "481290__erokia__msfxp2-248.wav", ",", "481291__erokia__msfxp2-250-2.wav", ",", "481292__erokia__msfxp2-250.wav", ",", "481293__erokia__msfxp2-412-2.wav", ",", "481294__erokia__msfxp2-412.wav", ",", "481295__erokia__msfxp2-413-2.wav", ",", "481296__erokia__msfxp2-408-2.wav", ",", "481297__erokia__msfxp2-414.wav", ",", "481298__erokia__msfxp2-413-3.wav", ",", "481299__erokia__msfxp2-409.wav", ",", "481300__erokia__msfxp2-227.wav", ",", "481301__erokia__msfxp2-250-5.wav", ",", "481302__erokia__msfxp2-228.wav", ",", "481303__erokia__msfxp2-158.wav", ",", "481304__erokia__msfxp2-159.wav", ",", "481305__erokia__msfxp2-156.wav", ",", "481306__erokia__msfxp2-157.wav", ",", "481307__erokia__msfxp2-154.wav", ",", "481308__erokia__msfxp2-155.wav", ",", "481309__erokia__msfxp2-152.wav", ",", "481310__erokia__msfxp2-153.wav", ",", "481311__erokia__msfxp2-404.wav", ",", "481312__erokia__msfxp2-407.wav", ",", "481313__erokia__msfxp2-160.wav", ",", "481314__erokia__msfxp2-161.wav", ",", "481315__erokia__msfxp2-420-2.wav", ",", "481316__erokia__msfxp2-421.wav", ",", "481317__erokia__msfxp2-418.wav", ",", "481318__erokia__msfxp2-419.wav", ",", "481319__erokia__msfxp2-416-3.wav", ",", "481320__erokia__msfxp2-291.wav", ",", "481321__erokia__msfxp2-416.wav", ",", "481322__erokia__msfxp2-416-2.wav", ",", "481323__erokia__msfxp2-256.wav", ",", "481324__erokia__msfxp2-241.wav", ",", "481325__erokia__msfxp2-241-2.wav", ",", "481326__erokia__msfxp2-239.wav", ",", "481327__erokia__msfxp2-240.wav", ",", "481328__erokia__msfxp2-238-2.wav", ",", "481329__erokia__msfxp2-238-3.wav", ",", "481330__erokia__msfxp2-237-2.wav", ",", "481331__erokia__msfxp2-238.wav", ",", "481332__erokia__msfxp2-236.wav", ",", "481333__erokia__msfxp2-237.wav", ",", "481334__erokia__msfxp2-296.wav", ",", "481335__erokia__msfxp2-417.wav", ",", "481336__erokia__msfxp2-166.wav", ",", "481337__erokia__msfxp2-165-2.wav", ",", "481338__erokia__msfxp2-168.wav", ",", "481339__erokia__msfxp2-167.wav", ",", "481340__erokia__msfxp2-163.wav", ",", "481341__erokia__msfxp2-162.wav", ",", "481342__erokia__msfxp2-165.wav", ",", "481343__erokia__msfxp2-164.wav", ",", "481344__erokia__msfxp2-231-2.wav", ",", "481345__erokia__msfxp2-170.wav", ",", "481346__erokia__msfxp2-169.wav", ",", "481347__erokia__msfxp2-231.wav", ",", "481348__erokia__msfxp2-266.wav", ",", "481349__erokia__msfxp2-265-2.wav", ",", "481350__erokia__msfxp2-271.wav", ",", "481351__erokia__msfxp2-270.wav", ",", "481352__erokia__msfxp2-269.wav", ",", "481353__erokia__msfxp2-268.wav", ",", "481354__erokia__msfxp2-272.wav", ",", "481355__erokia__msfxp2-271-2.wav", ",", "481356__erokia__msfxp2-295.wav", ",", "481357__erokia__msfxp2-402.wav", ",", "481358__erokia__msfxp2-204.wav", ",", "481359__erokia__msfxp2-203.wav", ",", "481360__erokia__msfxp2-401.wav", ",", "481361__erokia__msfxp2-198.wav", ",", "481362__erokia__msfxp2-197.wav", ",", "481363__erokia__msfxp2-196.wav", ",", "481364__erokia__msfxp2-202.wav", ",", "481365__erokia__msfxp2-201.wav", ",", "481366__erokia__msfxp2-200.wav", ",", "481367__erokia__msfxp2-251.wav", ",", "481368__erokia__msfxp2-400-2.wav", ",", "481369__erokia__msfxp2-300.wav", ",", "481370__erokia__msfxp2-289.wav", ",", "481371__erokia__msfxp2-407-2.wav", ",", "481372__erokia__msfxp2-299.wav", ",", "481373__erokia__msfxp2-132.wav", ",", "481374__erokia__msfxp2-133.wav", ",", "481375__erokia__msfxp2-134.wav", ",", "481376__erokia__msfxp2-135.wav", ",", "481377__erokia__msfxp2-136.wav", ",", "481378__erokia__msfxp2-137.wav", ",", "481379__erokia__msfxp2-138.wav", ",", "481380__erokia__msfxp2-139.wav", ",", "481381__erokia__msfxp2-140.wav", ",", "481382__erokia__msfxp2-141.wav", ",", "481383__erokia__msfxp2-277.wav", ",", "481384__erokia__msfxp2-234.wav", ",", "481385__erokia__msfxp2-288.wav", ",", "481386__erokia__msfxp2-273.wav", ",", "481387__erokia__msfxp2-274.wav", ",", "481388__erokia__msfxp2-275.wav", ",", "481389__erokia__msfxp2-275-2.wav", ",", "481390__erokia__msfxp2-276.wav", ",", "481391__erokia__msfxp2-262-2.wav", ",", "481392__erokia__msfxp2-278.wav", ",", "481393__erokia__msfxp2-279.wav", ",", "481394__erokia__msfxp2-280.wav", ",", "481395__erokia__msfxp2-280-2.wav", ",", "481397__erokia__msfxp2-262.wav", ",", "481398__erokia__msfxp2-403.wav", ",", "481399__erokia__msfxp2-193.wav", ",", "481400__erokia__msfxp2-194.wav", ",", "481401__erokia__msfxp2-185.wav", ",", "481402__erokia__msfxp2-186.wav", ",", "481403__erokia__msfxp2-187.wav", ",", "481404__erokia__msfxp2-188.wav", ",", "481405__erokia__msfxp2-189.wav", ",", "481406__erokia__msfxp2-190.wav", ",", "481407__erokia__msfxp2-191.wav", ",", "481408__erokia__msfxp2-261.wav", ",", "481409__erokia__msfxp2-260.wav", ",", "481410__erokia__msfxp2-259.wav", ",", "481411__erokia__msfxp2-258.wav", ",", "481412__erokia__msfxp2-263.wav", ",", "481413__erokia__msfxp2-262-3.wav", ",", "481414__erokia__msfxp2-151.wav", ",", "481415__erokia__msfxp2-150.wav", ",", "481416__erokia__msfxp2-149.wav", ",", "481417__erokia__msfxp2-148.wav", ",", "481418__erokia__msfxp2-147.wav", ",", "481419__erokia__msfxp2-146.wav", ",", "481420__erokia__msfxp2-145.wav", ",", "481421__erokia__msfxp2-144.wav", ",", "481422__erokia__msfxp2-143.wav", ",", "481423__erokia__msfxp2-142.wav", ",", "481424__erokia__msfxp2-387-4.wav", ",", "481425__erokia__msfxp2-387-3.wav", ",", "481426__erokia__msfxp2-388.wav", ",", "481427__erokia__msfxp2-387-5.wav", ",", "481428__erokia__msfxp2-386.wav", ",", "481429__erokia__msfxp2-385-2.wav", ",", "481430__erokia__msfxp2-387-2.wav", ",", "481431__erokia__msfxp2-390.wav", ",", "481432__erokia__msfxp2-389.wav", ",", "481434__erokia__msfxp2-323.wav", ",", "481435__erokia__msfxp2-323-2.wav", ",", "481436__erokia__msfxp2-318.wav", ",", "481437__erokia__msfxp2-319.wav", ",", "481438__erokia__msfxp2-316.wav", ",", "481439__erokia__msfxp2-317.wav", ",", "481440__erokia__msfxp2-322.wav", ",", "481441__erokia__msfxp2-322-2.wav", ",", "481442__erokia__msfxp2-320.wav", ",", "481443__erokia__msfxp2-321.wav", ",", "481444__erokia__msfxp2-381.wav", ",", "481445__erokia__msfxp2-381-2.wav", ",", "481446__erokia__msfxp2-379.wav", ",", "481447__erokia__msfxp2-380.wav", ",", "481448__erokia__msfxp2-382.wav", ",", "481449__erokia__msfxp2-383.wav", ",", "481450__erokia__msfxp2-381-3.wav", ",", "481451__erokia__msfxp2-381-4.wav", ",", "481452__erokia__msfxp2-384.wav", ",", "481453__erokia__msfxp2-385.wav", ",", "481454__erokia__msfxp2-331.wav", ",", "481455__erokia__msfxp2-330-2.wav", ",", "481456__erokia__msfxp2-324-2.wav", ",", "481457__erokia__msfxp2-324.wav", ",", "481458__erokia__msfxp2-326.wav", ",", "481459__erokia__msfxp2-325.wav", ",", "481460__erokia__msfxp2-328.wav", ",", "481461__erokia__msfxp2-327.wav", ",", "481462__erokia__msfxp2-330.wav", ",", "481463__erokia__msfxp2-329.wav", ",", "481464__erokia__msfxp2-399.wav", ",", "481465__erokia__msfxp2-398-2.wav", ",", "481466__erokia__msfxp2-398.wav", ",", "481467__erokia__msfxp2-397-3.wav", ",", "481468__erokia__msfxp2-357.wav", ",", "481469__erokia__msfxp2-358.wav", ",", "481470__erokia__msfxp2-396.wav", ",", "481471__erokia__msfxp2-395-3.wav", ",", "481472__erokia__msfxp2-354.wav", ",", "481473__erokia__msfxp2-354-2.wav", ",", "481474__erokia__msfxp2-355.wav", ",", "481475__erokia__msfxp2-356.wav", ",", "481476__erokia__msfxp2-351-3.wav", ",", "481477__erokia__msfxp2-352.wav", ",", "481478__erokia__msfxp2-353.wav", ",", "481479__erokia__msfxp2-392-3.wav", ",", "481480__erokia__msfxp2-392-4.wav", ",", "481481__erokia__msfxp2-365-2.wav", ",", "481482__erokia__msfxp2-365.wav", ",", "481483__erokia__msfxp2-390-2.wav", ",", "481484__erokia__msfxp2-391.wav", ",", "481485__erokia__msfxp2-392.wav", ",", "481486__erokia__msfxp2-392-2.wav", ",", "481487__erokia__msfxp2-361.wav", ",", "481488__erokia__msfxp2-360.wav", ",", "481489__erokia__msfxp2-359.wav", ",", "481490__erokia__msfxp2-358-2.wav", ",", "481491__erokia__msfxp2-364.wav", ",", "481492__erokia__msfxp2-363.wav", ",", "481493__erokia__msfxp2-362.wav", ",", "481494__erokia__msfxp2-361-2.wav", ",", "481495__erokia__msfxp2-309-3.wav", ",", "481496__erokia__msfxp2-309-2.wav", ",", "481497__erokia__msfxp2-309.wav", ",", "481498__erokia__msfxp2-308.wav", ",", "481499__erokia__msfxp2-313.wav", ",", "481500__erokia__msfxp2-312.wav", ",", "481501__erokia__msfxp2-311.wav", ",", "481502__erokia__msfxp2-310.wav", ",", "481503__erokia__msfxp2-315.wav", ",", "481504__erokia__msfxp2-393.wav", ",", "481505__erokia__msfxp2-394.wav", ",", "481506__erokia__msfxp2-301-4.wav", ",", "481507__erokia__msfxp2-301-3.wav", ",", "481508__erokia__msfxp2-301-2.wav", ",", "481509__erokia__msfxp2-301.wav", ",", "481510__erokia__msfxp2-305.wav", ",", "481511__erokia__msfxp2-304.wav", ",", "481512__erokia__msfxp2-303.wav", ",", "481513__erokia__msfxp2-302.wav", ",", "481514__erokia__msfxp2-307.wav", ",", "481515__erokia__msfxp2-306.wav", ",", "481516__erokia__msfxp2-395.wav", ",", "481517__erokia__msfxp2-395-2.wav", ",", "481518__erokia__msfxp2-343-2.wav", ",", "481519__erokia__msfxp2-343-3.wav", ",", "481520__erokia__msfxp2-342-2.wav", ",", "481521__erokia__msfxp2-343.wav", ",", "481522__erokia__msfxp2-341.wav", ",", "481523__erokia__msfxp2-342.wav", ",", "481524__erokia__msfxp2-340.wav", ",", "481525__erokia__msfxp2-340-2.wav", ",", "481526__erokia__msfxp2-343-4.wav", ",", "481527__erokia__msfxp2-344.wav", ",", "481528__erokia__msfxp2-348.wav", ",", "481529__erokia__msfxp2-347-2.wav", ",", "481530__erokia__msfxp2-350.wav", ",", "481531__erokia__msfxp2-349.wav", ",", "481533__erokia__msfxp2-345.wav", ",", "481534__erokia__msfxp2-347.wav", ",", "481535__erokia__msfxp2-346-2.wav", ",", "481536__erokia__msfxp2-397-2.wav", ",", "481537__erokia__msfxp2-351-2.wav", ",", "481538__erokia__msfxp2-351.wav", ",", "481539__erokia__msfxp2-397.wav", ",", "481540__erokia__msfxp2-378.wav", ",", "481541__erokia__msfxp2-377-2.wav", ",", "481542__erokia__msfxp2-375.wav", ",", "481543__erokia__msfxp2-374-2.wav", ",", "481544__erokia__msfxp2-374.wav", ",", "481545__erokia__msfxp2-373.wav", ",", "481546__erokia__msfxp2-377.wav", ",", "481547__erokia__msfxp2-376-3.wav", ",", "481548__erokia__msfxp2-376-2.wav", ",", "481549__erokia__msfxp2-376.wav", ",", "481550__erokia__msfxp2-332.wav", ",", "481551__erokia__msfxp2-332-2.wav", ",", "481552__erokia__msfxp2-333.wav", ",", "481553__erokia__msfxp2-334.wav", ",", "481554__erokia__msfxp2-335.wav", ",", "481555__erokia__msfxp2-336.wav", ",", "481556__erokia__msfxp2-336-2.wav", ",", "481557__erokia__msfxp2-336-3.wav", ",", "481558__erokia__msfxp2-336-4.wav", ",", "481559__erokia__msfxp2-336-5.wav", ",", "481560__erokia__msfxp2-371.wav", ",", "481561__erokia__msfxp2-372.wav", ",", "481562__erokia__msfxp2-366.wav", ",", "481563__erokia__msfxp2-367.wav", ",", "481564__erokia__msfxp2-367-2.wav", ",", "481565__erokia__msfxp2-368.wav", ",", "481566__erokia__msfxp2-368-2.wav", ",", "481567__erokia__msfxp2-369.wav", ",", "481568__erokia__msfxp2-370.wav", ",", "481569__erokia__msfxp2-370-2.wav", ",", "481570__erokia__msfxp2-339-2.wav", ",", "481571__erokia__msfxp2-339.wav", ",", "481572__erokia__msfxp2-338.wav", ",", "481573__erokia__msfxp2-337-6-pax.wav", ",", "481574__erokia__msfxp2-337-5-pax.wav", ",", "481575__erokia__msfxp2-337-4-pax.wav", ",", "481576__erokia__msfxp2-337-3-pax.wav", ",", "481577__erokia__msfxp2-337-2-pax.wav", ",", "481578__erokia__msfxp2-337-pax.wav", ",", "481579__erokia__msfxp2-336-6.wav", ",", "481580__erokia__msfxp2-408.wav", ",", "481970__erokia__msfxp2-346.wav" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 7.399999976158142, 413.537601755092624, 156.0, 21.0 ],
					"prefix" : "D:/my_workspace/dataset/erokia/audio/",
					"presentation" : 1,
					"presentation_rect" : [ 616.106262000000015, 7.15673981191226, 156.0, 21.0 ]
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-135",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 23.191666066646576, 388.908515425582891, 85.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 575.950012000000015, 7.15673981191226, 45.0, 19.0 ],
					"text" : "File:"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Magneto Bold",
					"fontsize" : 36.0,
					"id" : "obj-73",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 59.5, 562.0, 50.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 21.578125, 14.656739811912225, 523.0, 50.0 ],
					"text" : "Latent Timbre Synthesis"
				}

			}
, 			{
				"box" : 				{
					"autofit" : 1,
					"forceaspect" : 1,
					"id" : "obj-83",
					"maxclass" : "fpic",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "jit_matrix" ],
					"patching_rect" : [ 6.399999976158142, 10.124294668809746, 554.600000023841858, 47.375705331190254 ],
					"pic" : "logo.png",
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 0.0, 573.950012000000015, 49.028645225705333 ]
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 16.0,
					"id" : "obj-125",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 522.682972848415375, 2066.876600682735443, 159.5, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 344.344802141982086, 206.656739811912189, 159.5, 25.0 ],
					"text" : "Drop Run Folder"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 16.0,
					"id" : "obj-124",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 32.949633121490479, 2066.876600682735443, 195.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 25.578125, 206.656739811912189, 195.0, 25.0 ],
					"text" : "Drop Dataset Folder"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-111",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 697.464875742000686, 729.16030185026932, 128.0, 21.0 ],
					"text" : "s #0-audio-1-start"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-110",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 363.282978653907776, 1521.581581890583038, 128.0, 21.0 ],
					"text" : "r #0-audio-1-start"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 12.0,
					"id" : "obj-104",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 282.243749976158142, 147.5, 131.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 286.0, 82.156739811912217, 131.0, 23.0 ],
					"text" : "Philippe Pasquier"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-105",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 259.193761976158157, 147.5, 47.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 262.950012000000015, 82.156739811912217, 47.0, 19.0 ],
					"text" : "&"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 12.0,
					"id" : "obj-100",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 158.243749976158142, 146.5, 95.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 162.0, 81.156739811912217, 95.0, 23.0 ],
					"text" : "Daniel Bisig"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-102",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 135.193761976158157, 146.5, 47.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 138.950012000000015, 81.156739811912217, 47.0, 19.0 ],
					"text" : "&"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-94",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 315.02500194311142, 1086.600001275539398, 141.0, 21.0 ],
					"text" : "r #0-audio1-duration"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-93",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 198.191666066646576, 637.670940802524569, 141.0, 21.0 ],
					"text" : "s #0-audio1-duration"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
					"bgcolor2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
					"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "gradient",
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 8.0,
					"gradient" : 1,
					"id" : "obj-79",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 0.0, 176.5, 211.0, 27.0 ],
					"text" : ";\r\nmax launch_browser https://kivanctatar.com"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 12.0,
					"id" : "obj-78",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 0.0, 212.5, 95.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 10.15625, 114.156739811912217, 95.0, 23.0 ],
					"text" : "project info"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
					"bgcolor2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
					"bgfillcolor_color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
					"bgfillcolor_proportion" : 0.39,
					"bgfillcolor_type" : "gradient",
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 8.0,
					"gradient" : 1,
					"id" : "obj-76",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 0.0, 245.0, 327.0, 27.0 ],
					"text" : ";\r\nmax launch_browser https://kivanctatar.com/latent-timbre-synthesis"
				}

			}
, 			{
				"box" : 				{
					"fontsize" : 12.0,
					"id" : "obj-72",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 35.399999976158142, 146.5, 101.0, 23.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 39.15625, 81.156739811912217, 101.0, 23.0 ],
					"text" : "Kıvanç Tatar"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-67",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 6.399999976158142, 146.5, 44.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 10.15625, 81.156739811912217, 44.0, 19.0 ],
					"text" : "by "
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 16.0,
					"id" : "obj-69",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 399.399999976158142, 114.5, 163.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 419.0, 55.156739811912239, 163.0, 25.0 ],
					"text" : "Interpolate Two "
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-25",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 742.800006413459755, 1249.959579692314037, 84.0, 21.0 ],
					"text" : "t f f"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-32",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "float" ],
					"patching_rect" : [ 807.800006413459755, 1277.255317389965057, 66.0, 21.0 ],
					"text" : "t b f"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-35",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 764.800006413459755, 1304.455317795276642, 64.0, 21.0 ],
					"text" : "- 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-37",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 578.800006413459755, 1360.855319142341614, 39.0, 21.0 ],
					"text" : "t b"
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"bgcolor2" : [ 0.129411764705882, 0.137254901960784, 0.149019607843137, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_color1" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"bgfillcolor_color2" : [ 0.129411764705882, 0.137254901960784, 0.149019607843137, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "gradient",
					"fontname" : "Lucida Sans Typewriter ",
					"gradient" : 1,
					"id" : "obj-52",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 578.800006413459755, 1335.255318760871887, 121.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1028.900023999999803, 699.406739811912303, 121.0, 21.0 ],
					"text" : "Zoom to selection"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-55",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 701.800006413459755, 1365.030494185348289, 60.0, 21.0 ],
					"text" : "zl.reg"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-59",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 742.800006413459755, 1331.655312895774841, 68.0, 21.0 ],
					"text" : "pak 0. 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-234",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 183.282978653907776, 1823.943299174308777, 181.0, 34.0 ],
					"text" : "/interpolate_two/generate 1.723 0. 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-227",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 177.02500194311142, 1418.83335280418396, 95.0, 21.0 ],
					"text" : "loadmess 1000"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-226",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1256.500006526708603, 1233.504269049594768, 137.0, 21.0 ],
					"text" : "send #0-udpsend"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-225",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1256.500006526708603, 1207.937625692317852, 121.0, 21.0 ],
					"text" : "prepend /set_alfa"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-203",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1256.500006526708603, 1174.904282615611919, 128.0, 21.0 ],
					"text" : "zl 1000 group 1000"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-192",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "zlclear" ],
					"patching_rect" : [ 1256.500006526708603, 1084.537617269603743, 81.0, 21.0 ],
					"text" : "t b zlclear"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-183",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "int" ],
					"patching_rect" : [ 1256.500006526708603, 1112.970961591468722, 62.0, 21.0 ],
					"text" : "Uzi 1000"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-136",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 1256.500006526708603, 1142.437617364971175, 75.0, 21.0 ],
					"text" : "peek~ alfa"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-182",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 496.399999976158142, 393.537601755092624, 136.75, 21.0 ],
					"text" : "unpack 0. 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-176",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "float" ],
					"patching_rect" : [ 688.464893364906402, 760.389366149902344, 84.0, 21.0 ],
					"text" : "t f f"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-175",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "float" ],
					"patching_rect" : [ 759.464875742000686, 789.68510384755325, 66.0, 21.0 ],
					"text" : "t b f"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-169",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 710.464893364906402, 822.885104252864835, 64.0, 21.0 ],
					"text" : "- 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-165",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 557.06489980220806, 797.989366710186005, 39.0, 21.0 ],
					"text" : "t b"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-152",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 677.964893364906402, 876.485111488868711, 60.0, 21.0 ],
					"text" : "zl.reg"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-151",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 688.464893364906402, 850.085099353363034, 68.0, 21.0 ],
					"text" : "pak 0. 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-133",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1387.400015652179718, 783.804269419143679, 68.0, 21.0 ],
					"text" : "name alfa"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-131",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 4,
					"outlettype" : [ "int", "int", "int", "bang" ],
					"patching_rect" : [ 1250.800010681152344, 753.900005280971527, 96.0, 21.0 ],
					"text" : "t 3 0 0 b"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-130",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1250.800010681152344, 725.037597523162844, 62.0, 21.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"embed" : 1,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-129",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 1,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"openrect" : [ 177.0, 222.0, 188.0, 237.0 ],
						"bglocked" : 0,
						"openinpresentation" : 1,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 188.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "int" ],
									"patching_rect" : [ 17.0, 0.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"bkgndpict" : "wfmodes.png",
									"bottomvalue" : 3,
									"id" : "obj-11",
									"imagemask" : 1,
									"inactiveimage" : 0,
									"knobpict" : "wfknob.png",
									"maxclass" : "pictslider",
									"movehorizontal" : 0,
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 15.0, 58.5, 19.0, 76.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1.0, 0.5, 19.0, 76.0 ],
									"rightvalue" : 0,
									"topvalue" : 0
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595186999999999,
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 1,
											"revision" : 2,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 935.0, -932.0, 298.0, 526.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 10.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 1,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 1,
										"objectsnaponopen" : 1,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"lefttoolbarpinned" : 0,
										"toptoolbarpinned" : 0,
										"righttoolbarpinned" : 0,
										"bottomtoolbarpinned" : 0,
										"toolbars_unpinned_last_save" : 0,
										"tallnewobj" : 0,
										"boxanimatetime" : 200,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"style" : "",
										"subpatcher_template" : "",
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-24",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 17.0, 9.0, 137.0, 18.0 ],
													"style" : "helpfile_label",
													"text" : "(special thanks to Pure)"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-14",
													"index" : 2,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 225.0, 476.0, 25.0, 25.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontsize" : 12.0,
													"id" : "obj-13",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 225.0, 443.571411000000012, 44.0, 22.0 ],
													"text" : "set $1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-31",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 77.5, 154.0, 35.0, 22.0 ],
													"text" : "1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-30",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 20.0, 154.0, 35.0, 22.0 ],
													"text" : "2"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-29",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 19.0, 38.0, 61.0, 22.0 ],
													"text" : "loadbang"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-28",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 144.21875, 213.0, 60.929687999999999, 22.0 ],
													"text" : "switch"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-25",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 20.0, 126.0, 134.0, 22.0 ],
													"text" : "sel macintosh windows"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-22",
													"maxclass" : "newobj",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 20.0, 101.0, 106.0, 22.0 ],
													"text" : "r #0_getsystem"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-21",
													"linecount" : 2,
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 19.0, 64.0, 183.0, 36.0 ],
													"text" : ";\rmax getsystem #0_getsystem"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 144.21875, 408.571411000000012, 32.0, 22.0 ],
													"text" : "int"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-10",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 5,
													"outlettype" : [ "int", "int", "int", "int", "int" ],
													"patching_rect" : [ 121.25, 154.0, 105.53125, 22.0 ],
													"text" : "modifiers 100"
												}

											}
, 											{
												"box" : 												{
													"coll_data" : 													{
														"count" : 4,
														"data" : [ 															{
																"key" : 0,
																"value" : [ "mode", "select" ]
															}
, 															{
																"key" : 1,
																"value" : [ "mode", "loop" ]
															}
, 															{
																"key" : 2,
																"value" : [ "mode", "move" ]
															}
, 															{
																"key" : 3,
																"value" : [ "mode", "draw" ]
															}
 ]
													}
,
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-2",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "", "", "" ],
													"patching_rect" : [ 144.21875, 443.571411000000012, 62.0, 22.0 ],
													"saved_object_attributes" : 													{
														"embed" : 1,
														"precision" : 6
													}
,
													"text" : "coll"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-3",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 144.21875, 287.571411000000012, 32.0, 22.0 ],
													"text" : "|"
												}

											}
, 											{
												"box" : 												{
													"comment" : "waveform~ mode messages",
													"id" : "obj-4",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 32.5, 298.571411000000012, 25.0, 25.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-5",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 207.78125, 213.0, 36.0, 22.0 ],
													"text" : "<< 1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-6",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "", "int", "int" ],
													"patching_rect" : [ 144.21875, 319.571411000000012, 51.0, 22.0 ],
													"text" : "change"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-7",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "" ],
													"patching_rect" : [ 144.21875, 352.571411000000012, 99.78125, 22.0 ],
													"text" : "select 0"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-8",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 144.21875, 253.571411000000012, 36.0, 22.0 ],
													"text" : "pak"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-9",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 144.21875, 476.0, 25.0, 25.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"order" : 0,
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"order" : 1,
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-28", 2 ],
													"source" : [ "obj-10", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-28", 1 ],
													"source" : [ "obj-10", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-5", 0 ],
													"source" : [ "obj-10", 4 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-14", 0 ],
													"source" : [ "obj-13", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-25", 0 ],
													"source" : [ "obj-22", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-30", 0 ],
													"source" : [ "obj-25", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-31", 0 ],
													"source" : [ "obj-25", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 0 ],
													"source" : [ "obj-28", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 0 ],
													"source" : [ "obj-29", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-6", 0 ],
													"source" : [ "obj-3", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-28", 0 ],
													"source" : [ "obj-30", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-28", 0 ],
													"source" : [ "obj-31", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"source" : [ "obj-4", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 1 ],
													"source" : [ "obj-5", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-7", 0 ],
													"source" : [ "obj-6", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"source" : [ "obj-7", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"order" : 0,
													"source" : [ "obj-7", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"order" : 1,
													"source" : [ "obj-7", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-3", 0 ],
													"source" : [ "obj-8", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 17.0, 153.5, 54.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"fontsize" : 10.0,
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p wfkeys"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-22",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 17.0, 190.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 1 ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"source" : [ "obj-11", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 1 ],
									"midpoints" : [ 61.5, 190.5, 112.0, 190.5, 112.0, 48.5, 26.5, 48.5 ],
									"source" : [ "obj-15", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 1250.800010681152344, 790.804269419143679, 21.0, 79.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-127",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "bang" ],
					"patching_rect" : [ 1656.200003826618286, 757.804281399677279, 58.0, 21.0 ],
					"text" : "t b b"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-126",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1656.200003826618286, 783.804269419143679, 101.0, 21.0 ],
					"text" : "fill sin 1.5 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-123",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1763.900015354156494, 783.804269419143679, 115.0, 21.0 ],
					"text" : "sizeinsamps 1000"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-120",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 1656.200003826618286, 734.60428105397034, 62.0, 21.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-118",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 1656.200003826618286, 836.004270003269198, 88.0, 21.0 ],
					"text" : "buffer~ alfa"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-117",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1924.5, 1496.833321452140808, 101.0, 21.0 ],
					"text" : "loadmess clear"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-86",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1727.200001180171967, 1428.499979197978973, 101.0, 21.0 ],
					"text" : "prepend insert"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-115",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1817.400015294551849, 1607.233331799507141, 188.0, 21.0 ],
					"text" : "prepend /audio/device/out"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-116",
					"items" : [ "Microsoft", "Sound", "Mapper", "-", "Input", ",", "Microphone", "Array", "(Realtek(R)", "Au", ",", "Microsoft", "Sound", "Mapper", "-", "Output", ",", "Speakers", "(Realtek(R)", "Audio)", ",", "Speakers", "(Realtek", "HD", "Audio", "output)", ",", "Microphone", "Array", "(Realtek", "HD", "Audio", "Mic", "input)", ",", "Stereo", "Mix", "(Realtek", "HD", "Audio", "Stereo", "input)" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1815.400015294551849, 1496.833321452140808, 100.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 317.344802141982086, 527.81545108899752, 227.233322858017914, 21.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-113",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1706.200001180171967, 1574.233331799507141, 168.0, 21.0 ],
					"text" : "prepend /audio/device/in"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-112",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 1706.200001180171967, 1366.1333367228508, 108.0, 21.0 ],
					"text" : "routepass clear"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-85",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1706.200001180171967, 1334.533324539661407, 75.0, 21.0 ],
					"text" : "fromsymbol"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-75",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 1706.200001180171967, 1304.000013828277588, 278.0, 21.0 ],
					"text" : "route /audio/devicelist /audio/io"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-71",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1562.200008004903793, 1575.600017726421356, 121.0, 21.0 ],
					"text" : "/audio/devicelist"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-68",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1562.200008004903793, 1547.599990367889404, 307.0, 21.0 ],
					"presentation" : 1,
					"presentation_linecount" : 2,
					"presentation_rect" : [ 317.344802141982086, 413.784624813236519, 194.0, 34.0 ],
					"text" : "Get Available Audio Devices for Python Engine"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-56",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1562.200008004903793, 1524.599990367889404, 185.0, 19.0 ],
					"text" : "Get Python audio devices"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-28",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1562.200008004903793, 1633.599990367889404, 137.0, 21.0 ],
					"text" : "send #0-udpsend"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-21",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 1706.200001180171967, 1270.466673195362091, 108.0, 21.0 ],
					"text" : "r #0-udpreceive"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-19",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 513.716324299573898, 2372.543262541294098, 120.0, 21.0 ],
					"text" : "s #0-udpreceive"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-11",
					"items" : [ "Microsoft", "Sound", "Mapper", "-", "Input", ",", "Microphone", "Array", "(Realtek(R)", "Au", ",", "Microsoft", "Sound", "Mapper", "-", "Output", ",", "Speakers", "(Realtek(R)", "Audio)", ",", "Speakers", "(Realtek", "HD", "Audio", "output)", ",", "Microphone", "Array", "(Realtek", "HD", "Audio", "Mic", "input)", ",", "Stereo", "Mix", "(Realtek", "HD", "Audio", "Stereo", "input)" ],
					"maxclass" : "umenu",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "int", "", "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 1703.80000114440918, 1496.833321452140808, 100.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 317.344802141982086, 475.987566695640453, 227.233322858017914, 21.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-64",
					"linecount" : 2,
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 328.782978653907776, 1723.876623511314392, 175.0, 34.0 ],
					"text" : "prepend /interpolate_two/generate"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-61",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 183.282978653907776, 1757.743311405181885, 60.0, 21.0 ],
					"text" : "zl.reg"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-58",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 575.299994766712075, 1575.94328373670578, 55.0, 21.0 ],
					"text" : "/ 1000."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-57",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 363.282978653907776, 1680.376623511314392, 166.5, 21.0 ],
					"text" : "3.047 2.596916 0.00025"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-54",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 328.782978653907776, 1619.376623511314392, 201.0, 21.0 ],
					"text" : "vexpr $f1/1000. @scalarmode 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-53",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 328.782978653907776, 1589.376617789268494, 88.0, 21.0 ],
					"text" : "pak 0. 0. 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-49",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 183.282978653907776, 1787.743284046649933, 108.0, 21.0 ],
					"text" : "send #0-udpsend"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-48",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 81.191666066646576, 931.837606893013003, 93.0, 21.0 ],
					"text" : "t s s s"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-47",
					"linecount" : 3,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 149.899999976158142, 959.495733394195781, 233.0, 47.0 ],
					"text" : "D:/my_workspace/dataset/erokia/audio/481209__erokia__msfxp2-415.wav"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-46",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 75.899999976158142, 440.537601755092624, 93.0, 21.0 ],
					"text" : "t s s s"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-43",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 81.191666066646576, 1228.056757569313049, 108.0, 21.0 ],
					"text" : "send #0-udpsend"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-44",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 81.191666066646576, 1199.656762063503265, 327.0, 21.0 ],
					"text" : "prepend /sound/interpolate_two/second/audio_path"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-42",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 18.899999976158142, 695.437603221366885, 108.0, 21.0 ],
					"text" : "send #0-udpsend"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-41",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 33.949633121490479, 2292.87659615278244, 70.0, 21.0 ],
					"text" : "t s s"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-39",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 18.899999976158142, 667.037607715557101, 320.0, 21.0 ],
					"text" : "prepend /sound/interpolate_two/first/audio_path"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-36",
					"linecount" : 3,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 120.0, 483.075199755092626, 214.0, 47.0 ],
					"text" : "D:/my_workspace/dataset/erokia/audio/473244__erokia__msfxp-sound-517.wav"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-34",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 58.282966077327728, 2490.543262541294098, 128.0, 21.0 ],
					"text" : "receive #0-udpsend"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-27",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 503.366309314966202, 2308.276591658592224, 108.0, 21.0 ],
					"text" : "send #0-udpsend"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-95",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 763.814893364906311, 393.537601755092624, 70.0, 21.0 ],
					"text" : "clip"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-84",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 382.400008201599121, 359.704276607463839, 62.0, 21.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-77",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 823.942559361457825, 935.02909623188782, 70.0, 21.0 ],
					"text" : "clip"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-65",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 399.399999976158142, 571.370950506160739, 75.0, 21.0 ],
					"text" : "loadmess 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-51",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 328.782978653907776, 1493.472341418266296, 148.0, 21.0 ],
					"text" : "expr $f1/10000. * $f2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-50",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 575.299994766712075, 1730.776619017124176, 148.0, 21.0 ],
					"text" : "prepend set Duration:"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-38",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 328.782978653907776, 1521.805675804615021, 29.5, 21.0 ],
					"text" : "f",
					"varname" : "duration"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-33",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 164.02500194311142, 1113.933354377746582, 170.0, 21.0 ],
					"text" : "pak 0. 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-31",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "int", "int" ],
					"patching_rect" : [ 164.02500194311142, 1138.266689419746399, 55.0, 21.0 ],
					"text" : "minimum"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-29",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 9,
					"outlettype" : [ "float", "list", "float", "float", "float", "float", "float", "", "int" ],
					"patching_rect" : [ 81.191666066646576, 608.504279957244876, 175.0, 21.0 ],
					"text" : "info~ audio1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-22",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 9,
					"outlettype" : [ "float", "list", "float", "float", "float", "float", "float", "", "int" ],
					"patching_rect" : [ 101.02500194311142, 1079.600019812583923, 168.0, 21.0 ],
					"text" : "info~ audio2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-1",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 33.949633121490479, 2551.376600682735443, 252.0, 21.0 ],
					"text" : "udpsend 127.0.0.1 7020"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-97",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 940.692559361457825, 816.612780080268749, 95.0, 21.0 ],
					"text" : "pvar duration"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-98",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "float" ],
					"patching_rect" : [ 940.692559361457825, 911.446109996269229, 70.0, 21.0 ],
					"text" : "t b f"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-99",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 941.692559361457825, 938.908511996269226, 56.0, 21.0 ],
					"text" : "+ 0."
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-92",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 901.564893364906311, 335.000027239322662, 95.0, 21.0 ],
					"text" : "pvar duration"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-88",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "bang", "float" ],
					"patching_rect" : [ 901.564893364906311, 361.337624893615725, 70.0, 21.0 ],
					"text" : "t b f"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-89",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "float" ],
					"patching_rect" : [ 901.564893364906311, 393.537601755092624, 56.0, 21.0 ],
					"text" : "+ 0."
				}

			}
, 			{
				"box" : 				{
					"annotation" : "A simple stereo audio mixing module. ",
					"args" : [ "Audio2" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-208",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "AudioMix.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 1283.400015354156494, 1633.600025415420532, 69.0, 139.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1152.906249284744263, 495.356740217223773, 69.0, 139.0 ],
					"varname" : "AudioMix[2]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-217",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 444.400006413459778, 1055.129078938533894, 95.0, 21.0 ],
					"text" : "name audio2 2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-219",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 444.400006413459778, 972.29572583632671, 66.0, 21.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-229",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 456.50002403636563, 1008.29572583632671, 95.0, 21.0 ],
					"text" : "name audio2 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-233",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "bang" ],
					"patching_rect" : [ 1283.400015354156494, 1604.133369641918307, 101.0, 21.0 ],
					"text" : "play~ audio2 2"
				}

			}
, 			{
				"box" : 				{
					"annotation" : "A stereo/dual mono audio output chooser.",
					"args" : [ "@output", 1 ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-206",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "AudioOutput.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 1100.024999976158142, 1788.466716527938843, 69.0, 29.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1152.906249284744263, 376.256740014567981, 69.0, 29.0 ],
					"varname" : "AudioOutput",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"annotation" : "A simple stereo audio mixing module. ",
					"args" : [ "Audio1" ],
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-205",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"name" : "AudioMix.maxpat",
					"numinlets" : 3,
					"numoutlets" : 3,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "signal", "signal", "" ],
					"patching_rect" : [ 915.149999260902405, 1625.100011169910431, 69.0, 139.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1152.906249284744263, 107.156739811912246, 69.0, 139.0 ],
					"varname" : "AudioMix[1]",
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-197",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 118.191666066646576, 1014.600001275539398, 168.0, 21.0 ],
					"text" : "prepend replace"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-198",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 118.191666066646576, 1044.600001275539398, 134.0, 21.0 ],
					"text" : "buffer~ audio2 -1 2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-199",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 12.691666066646576, 856.637607024143222, 160.0, 21.0 ],
					"text" : "prepend prefix"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-201",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 12.691666066646576, 793.637607024143222, 134.0, 21.0 ],
					"text" : "r #0-dataset"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-202",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 12.691666066646576, 824.175205024143224, 198.0, 21.0 ],
					"text" : "combine ./ audio/"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-181",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 378.399999976158142, 527.87094090981293, 95.0, 21.0 ],
					"text" : "name audio1 2"
				}

			}
, 			{
				"box" : 				{
					"bgmode" : 0,
					"border" : 0,
					"clickthrough" : 0,
					"embed" : 1,
					"enablehscroll" : 0,
					"enablevscroll" : 0,
					"id" : "obj-186",
					"lockeddragscroll" : 0,
					"maxclass" : "bpatcher",
					"numinlets" : 1,
					"numoutlets" : 1,
					"offset" : [ 0.0, 0.0 ],
					"outlettype" : [ "" ],
					"patcher" : 					{
						"fileversion" : 1,
						"appversion" : 						{
							"major" : 8,
							"minor" : 1,
							"revision" : 2,
							"architecture" : "x64",
							"modernui" : 1
						}
,
						"classnamespace" : "box",
						"openrect" : [ 177.0, 222.0, 188.0, 237.0 ],
						"bglocked" : 0,
						"openinpresentation" : 1,
						"default_fontsize" : 12.0,
						"default_fontface" : 0,
						"default_fontname" : "Arial",
						"gridonopen" : 1,
						"gridsize" : [ 15.0, 15.0 ],
						"gridsnaponopen" : 1,
						"objectsnaponopen" : 1,
						"statusbarvisible" : 2,
						"toolbarvisible" : 1,
						"lefttoolbarpinned" : 0,
						"toptoolbarpinned" : 0,
						"righttoolbarpinned" : 0,
						"bottomtoolbarpinned" : 0,
						"toolbars_unpinned_last_save" : 0,
						"tallnewobj" : 0,
						"boxanimatetime" : 200,
						"enablehscroll" : 1,
						"enablevscroll" : 1,
						"devicewidth" : 188.0,
						"description" : "",
						"digest" : "",
						"tags" : "",
						"style" : "",
						"subpatcher_template" : "",
						"boxes" : [ 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-1",
									"index" : 1,
									"maxclass" : "inlet",
									"numinlets" : 0,
									"numoutlets" : 1,
									"outlettype" : [ "" ],
									"patching_rect" : [ 17.0, 0.0, 30.0, 30.0 ]
								}

							}
, 							{
								"box" : 								{
									"bkgndpict" : "wfmodes.png",
									"bottomvalue" : 3,
									"id" : "obj-11",
									"imagemask" : 1,
									"inactiveimage" : 0,
									"knobpict" : "wfknob.png",
									"maxclass" : "pictslider",
									"movehorizontal" : 0,
									"numinlets" : 2,
									"numoutlets" : 2,
									"outlettype" : [ "int", "int" ],
									"parameter_enable" : 0,
									"patching_rect" : [ 15.0, 58.5, 19.0, 76.0 ],
									"presentation" : 1,
									"presentation_rect" : [ 1.0, 0.5, 19.0, 76.0 ],
									"rightvalue" : 0,
									"topvalue" : 0
								}

							}
, 							{
								"box" : 								{
									"fontname" : "Arial",
									"fontsize" : 11.595186999999999,
									"id" : "obj-15",
									"maxclass" : "newobj",
									"numinlets" : 1,
									"numoutlets" : 2,
									"outlettype" : [ "", "" ],
									"patcher" : 									{
										"fileversion" : 1,
										"appversion" : 										{
											"major" : 8,
											"minor" : 1,
											"revision" : 2,
											"architecture" : "x64",
											"modernui" : 1
										}
,
										"classnamespace" : "box",
										"rect" : [ 935.0, -932.0, 298.0, 526.0 ],
										"bglocked" : 0,
										"openinpresentation" : 0,
										"default_fontsize" : 10.0,
										"default_fontface" : 0,
										"default_fontname" : "Arial",
										"gridonopen" : 1,
										"gridsize" : [ 15.0, 15.0 ],
										"gridsnaponopen" : 1,
										"objectsnaponopen" : 1,
										"statusbarvisible" : 2,
										"toolbarvisible" : 1,
										"lefttoolbarpinned" : 0,
										"toptoolbarpinned" : 0,
										"righttoolbarpinned" : 0,
										"bottomtoolbarpinned" : 0,
										"toolbars_unpinned_last_save" : 0,
										"tallnewobj" : 0,
										"boxanimatetime" : 200,
										"enablehscroll" : 1,
										"enablevscroll" : 1,
										"devicewidth" : 0.0,
										"description" : "",
										"digest" : "",
										"tags" : "",
										"style" : "",
										"subpatcher_template" : "",
										"boxes" : [ 											{
												"box" : 												{
													"id" : "obj-24",
													"maxclass" : "comment",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 17.0, 9.0, 137.0, 18.0 ],
													"style" : "helpfile_label",
													"text" : "(special thanks to Pure)"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-14",
													"index" : 2,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 225.0, 476.0, 25.0, 25.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontsize" : 12.0,
													"id" : "obj-13",
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 225.0, 443.571411000000012, 44.0, 22.0 ],
													"text" : "set $1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-31",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 77.5, 154.0, 35.0, 22.0 ],
													"text" : "1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-30",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 20.0, 154.0, 35.0, 22.0 ],
													"text" : "2"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-29",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 1,
													"outlettype" : [ "bang" ],
													"patching_rect" : [ 19.0, 38.0, 61.0, 22.0 ],
													"text" : "loadbang"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-28",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 144.21875, 213.0, 60.929687999999999, 22.0 ],
													"text" : "switch"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-25",
													"maxclass" : "newobj",
													"numinlets" : 3,
													"numoutlets" : 3,
													"outlettype" : [ "bang", "bang", "" ],
													"patching_rect" : [ 20.0, 126.0, 134.0, 22.0 ],
													"text" : "sel macintosh windows"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-22",
													"maxclass" : "newobj",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 20.0, 101.0, 106.0, 22.0 ],
													"text" : "r #0_getsystem"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-21",
													"linecount" : 2,
													"maxclass" : "message",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 19.0, 64.0, 183.0, 36.0 ],
													"text" : ";\rmax getsystem #0_getsystem"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-1",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 144.21875, 408.571411000000012, 32.0, 22.0 ],
													"text" : "int"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-10",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 5,
													"outlettype" : [ "int", "int", "int", "int", "int" ],
													"patching_rect" : [ 121.25, 154.0, 105.53125, 22.0 ],
													"text" : "modifiers 100"
												}

											}
, 											{
												"box" : 												{
													"coll_data" : 													{
														"count" : 4,
														"data" : [ 															{
																"key" : 0,
																"value" : [ "mode", "select" ]
															}
, 															{
																"key" : 1,
																"value" : [ "mode", "loop" ]
															}
, 															{
																"key" : 2,
																"value" : [ "mode", "move" ]
															}
, 															{
																"key" : 3,
																"value" : [ "mode", "draw" ]
															}
 ]
													}
,
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-2",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 4,
													"outlettype" : [ "", "", "", "" ],
													"patching_rect" : [ 144.21875, 443.571411000000012, 62.0, 22.0 ],
													"saved_object_attributes" : 													{
														"embed" : 1,
														"precision" : 6
													}
,
													"text" : "coll"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-3",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 144.21875, 287.571411000000012, 32.0, 22.0 ],
													"text" : "|"
												}

											}
, 											{
												"box" : 												{
													"comment" : "waveform~ mode messages",
													"id" : "obj-4",
													"index" : 1,
													"maxclass" : "inlet",
													"numinlets" : 0,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 32.5, 298.571411000000012, 25.0, 25.0 ]
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-5",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "int" ],
													"patching_rect" : [ 207.78125, 213.0, 36.0, 22.0 ],
													"text" : "<< 1"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-6",
													"maxclass" : "newobj",
													"numinlets" : 1,
													"numoutlets" : 3,
													"outlettype" : [ "", "int", "int" ],
													"patching_rect" : [ 144.21875, 319.571411000000012, 51.0, 22.0 ],
													"text" : "change"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-7",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 2,
													"outlettype" : [ "bang", "" ],
													"patching_rect" : [ 144.21875, 352.571411000000012, 99.78125, 22.0 ],
													"text" : "select 0"
												}

											}
, 											{
												"box" : 												{
													"fontname" : "Arial",
													"fontsize" : 12.0,
													"id" : "obj-8",
													"maxclass" : "newobj",
													"numinlets" : 2,
													"numoutlets" : 1,
													"outlettype" : [ "" ],
													"patching_rect" : [ 144.21875, 253.571411000000012, 36.0, 22.0 ],
													"text" : "pak"
												}

											}
, 											{
												"box" : 												{
													"comment" : "",
													"id" : "obj-9",
													"index" : 1,
													"maxclass" : "outlet",
													"numinlets" : 1,
													"numoutlets" : 0,
													"patching_rect" : [ 144.21875, 476.0, 25.0, 25.0 ]
												}

											}
 ],
										"lines" : [ 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"order" : 0,
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"order" : 1,
													"source" : [ "obj-1", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-28", 2 ],
													"source" : [ "obj-10", 3 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-28", 1 ],
													"source" : [ "obj-10", 2 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-5", 0 ],
													"source" : [ "obj-10", 4 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-14", 0 ],
													"source" : [ "obj-13", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-9", 0 ],
													"source" : [ "obj-2", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-25", 0 ],
													"source" : [ "obj-22", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-30", 0 ],
													"source" : [ "obj-25", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-31", 0 ],
													"source" : [ "obj-25", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 0 ],
													"source" : [ "obj-28", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-21", 0 ],
													"source" : [ "obj-29", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-6", 0 ],
													"source" : [ "obj-3", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-28", 0 ],
													"source" : [ "obj-30", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-28", 0 ],
													"source" : [ "obj-31", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"source" : [ "obj-4", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-8", 1 ],
													"source" : [ "obj-5", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-7", 0 ],
													"source" : [ "obj-6", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-1", 0 ],
													"source" : [ "obj-7", 0 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-13", 0 ],
													"order" : 0,
													"source" : [ "obj-7", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-2", 0 ],
													"order" : 1,
													"source" : [ "obj-7", 1 ]
												}

											}
, 											{
												"patchline" : 												{
													"destination" : [ "obj-3", 0 ],
													"source" : [ "obj-8", 0 ]
												}

											}
 ]
									}
,
									"patching_rect" : [ 17.0, 153.5, 54.0, 22.0 ],
									"saved_object_attributes" : 									{
										"description" : "",
										"digest" : "",
										"fontsize" : 10.0,
										"globalpatchername" : "",
										"tags" : ""
									}
,
									"text" : "p wfkeys"
								}

							}
, 							{
								"box" : 								{
									"comment" : "",
									"id" : "obj-22",
									"index" : 1,
									"maxclass" : "outlet",
									"numinlets" : 1,
									"numoutlets" : 0,
									"patching_rect" : [ 17.0, 190.0, 30.0, 30.0 ]
								}

							}
 ],
						"lines" : [ 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 1 ],
									"source" : [ "obj-1", 0 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-15", 0 ],
									"source" : [ "obj-11", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-11", 1 ],
									"midpoints" : [ 61.5, 190.5, 112.0, 190.5, 112.0, 48.5, 26.5, 48.5 ],
									"source" : [ "obj-15", 1 ]
								}

							}
, 							{
								"patchline" : 								{
									"destination" : [ "obj-22", 0 ],
									"source" : [ "obj-15", 0 ]
								}

							}
 ]
					}
,
					"patching_rect" : [ 399.399999976158142, 600.037607715557101, 21.0, 79.0 ],
					"viewvisibility" : 1
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-195",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 390.800000250339508, 428.37094090981293, 96.0, 21.0 ],
					"text" : "name audio1 1"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-164",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 81.191666066646576, 545.170940802524569, 115.0, 21.0 ],
					"text" : "prepend replace"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-161",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 3,
					"outlettype" : [ "signal", "signal", "bang" ],
					"patching_rect" : [ 915.149999260902405, 1582.0, 101.0, 21.0 ],
					"text" : "play~ audio1 2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-66",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "float", "bang" ],
					"patching_rect" : [ 81.191666066646576, 575.170940802524569, 134.0, 21.0 ],
					"text" : "buffer~ audio1 -1 2"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-103",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 7.399999976158142, 362.537601755092624, 160.0, 21.0 ],
					"text" : "prepend prefix"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-90",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 84.949633121490479, 2329.276591658592224, 92.0, 21.0 ],
					"text" : "s #0-dataset"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-80",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 7.399999976158142, 299.537601755092624, 134.0, 21.0 ],
					"text" : "r #0-dataset"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-70",
					"maxclass" : "newobj",
					"numinlets" : 2,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 7.399999976158142, 330.075199755092626, 198.0, 21.0 ],
					"text" : "combine ./ audio/"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-17",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "", "", "" ],
					"patching_rect" : [ 309.716324299573898, 2340.376600682735443, 223.0, 21.0 ],
					"text" : "route /dataset /report"
				}

			}
, 			{
				"box" : 				{
					"dontreplace" : 1,
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-12",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 58.282966077327728, 2207.376600682735443, 207.0, 34.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 4.0, 272.347028863636297, 266.25, 21.0 ],
					"text" : "D:/my_workspace/dataset/erokia/"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-9",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 309.716324299573898, 2308.376600682735443, 111.0, 21.0 ],
					"text" : "udpreceive 7021"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-8",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 503.366309314966202, 2275.876600682735443, 135.0, 21.0 ],
					"text" : "prepend /load/model"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-7",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 503.366309314966202, 2241.876600682735443, 161.0, 21.0 ],
					"text" : "conformpath native boot"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-2",
					"maxclass" : "dropfile",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 503.366309314966202, 2036.876600682735443, 195.0, 85.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 290.0, 176.656739811912189, 265.710419716035858, 85.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-16",
					"maxclass" : "newobj",
					"numinlets" : 3,
					"numoutlets" : 3,
					"outlettype" : [ "bang", "bang", "" ],
					"patching_rect" : [ 243.282978653907776, 2177.876600801944733, 168.0, 21.0 ],
					"text" : "sel macintosh windows"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-10",
					"maxclass" : "newobj",
					"numinlets" : 0,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 243.282978653907776, 2144.876600682735443, 81.0, 21.0 ],
					"text" : "r whereami"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-6",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "int" ],
					"patching_rect" : [ 37.949633121490479, 2256.876600682735443, 161.0, 21.0 ],
					"text" : "conformpath native boot"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-3",
					"linecount" : 2,
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 243.282978653907776, 2108.876606047153473, 256.0, 34.0 ],
					"text" : ";\r\nmax getsystem whereami"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-20",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "bang" ],
					"patching_rect" : [ 243.282978653907776, 2083.876606047153473, 93.0, 21.0 ],
					"text" : "loadbang"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-5",
					"maxclass" : "dropfile",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "" ],
					"patching_rect" : [ 32.949633121490479, 2036.876600682735443, 193.25, 85.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 4.0, 176.656739811912189, 266.25, 85.0 ]
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-4",
					"maxclass" : "newobj",
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 33.949633121490479, 2368.876600682735443, 153.0, 21.0 ],
					"text" : "prepend /load/dataset"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"grad1" : [ 0.062745098039216, 0.066666666666667, 0.066666666666667, 1.0 ],
					"grad2" : [ 0.129411764705882, 0.137254901960784, 0.149019607843137, 1.0 ],
					"id" : "obj-109",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 0.0, 114.5, 562.399999976158142, 16.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 47.406739811912225, 573.950012000000015, 91.5 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 16.0,
					"id" : "obj-96",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1250.800010681152344, 688.904268668125155, 202.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 761.925018000000136, 326.256740014567981, 202.0, 25.0 ],
					"text" : "Interpolation Curve"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 16.0,
					"id" : "obj-114",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 554.400006413459778, 894.500001132488251, 84.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 834.925018000000136, 456.856740217223717, 80.0, 25.0 ],
					"text" : "AUDIO 2"
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 16.0,
					"id" : "obj-236",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 494.524999976158142, 330.075202556510931, 84.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 834.925018000000136, 46.15673981191226, 80.0, 25.0 ],
					"text" : "AUDIO 1"
				}

			}
, 			{
				"box" : 				{
					"allowdrag" : 0,
					"bgcolor" : [ 0.196078431372549, 0.188235294117647, 0.2, 0.31 ],
					"buffername" : "alfa",
					"clipdraw" : 1,
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 11.0,
					"grid" : 125.0,
					"id" : "obj-128",
					"labels" : 0,
					"maxclass" : "waveform~",
					"norulerclick" : 0,
					"numinlets" : 5,
					"numoutlets" : 6,
					"outlettype" : [ "float", "float", "float", "float", "list", "" ],
					"patching_rect" : [ 1250.800010681152344, 888.500001132488251, 501.200000166893005, 120.200000405311584 ],
					"presentation" : 1,
					"presentation_rect" : [ 575.950012000000015, 308.156739811912189, 573.950012000000015, 133.200000405311584 ],
					"ruler" : 0,
					"setmode" : 3,
					"setunit" : 1,
					"vzoom" : 2.0,
					"waveformcolor" : [ 0.701960784313725, 0.415686274509804, 0.886274509803922, 0.85 ]
				}

			}
, 			{
				"box" : 				{
					"allowdrag" : 0,
					"bgcolor" : [ 0.196078431372549, 0.188235294117647, 0.2, 0.64 ],
					"buffername" : "audio1",
					"chanoffset" : 2,
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 11.0,
					"grid" : 0.125,
					"id" : "obj-184",
					"labels" : 0,
					"maxclass" : "waveform~",
					"numinlets" : 5,
					"numoutlets" : 6,
					"outlettype" : [ "float", "float", "float", "float", "list", "" ],
					"patching_rect" : [ 497.463829755783081, 574.679451213310244, 490.0, 93.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 575.950012000000015, 158.156739811912217, 573.950012000000015, 122.0 ],
					"ruler" : 0,
					"selectioncolor" : [ 0.113725, 0.580392, 0.737255, 1.0 ],
					"setmode" : 3,
					"setunit" : 2,
					"ticks" : 8,
					"vticks" : 0
				}

			}
, 			{
				"box" : 				{
					"allowdrag" : 0,
					"bgcolor" : [ 0.196078431372549, 0.188235294117647, 0.2, 0.64 ],
					"buffername" : "audio1",
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 11.0,
					"grid" : 0.125,
					"id" : "obj-196",
					"labels" : -16,
					"maxclass" : "waveform~",
					"numinlets" : 5,
					"numoutlets" : 6,
					"outlettype" : [ "float", "float", "float", "float", "list", "" ],
					"patching_rect" : [ 496.399999976158142, 428.37094090981293, 490.0, 93.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 575.950012000000015, 30.156739811912253, 573.950012000000015, 125.999999999999972 ],
					"ruler" : -16,
					"selectioncolor" : [ 0.113725, 0.580392, 0.737255, 1.0 ],
					"setmode" : 3,
					"setunit" : 2,
					"ticks" : 8,
					"vticks" : 0
				}

			}
, 			{
				"box" : 				{
					"allowdrag" : 0,
					"bgcolor" : [ 0.196078431372549, 0.188235294117647, 0.2, 0.64 ],
					"buffername" : "audio2",
					"chanoffset" : 2,
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 11.0,
					"grid" : 0.125,
					"id" : "obj-218",
					"labels" : 0,
					"maxclass" : "waveform~",
					"numinlets" : 5,
					"numoutlets" : 6,
					"outlettype" : [ "float", "float", "float", "float", "list", "" ],
					"patching_rect" : [ 554.400006413459778, 1118.761714100837708, 490.0, 93.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 575.950012000000015, 569.356740217223887, 573.950012000000015, 124.0 ],
					"ruler" : 0,
					"selectioncolor" : [ 0.113725, 0.580392, 0.737255, 1.0 ],
					"setmode" : 3,
					"setunit" : 2,
					"ticks" : 8,
					"vticks" : 0
				}

			}
, 			{
				"box" : 				{
					"allowdrag" : 0,
					"bgcolor" : [ 0.196078431372549, 0.188235294117647, 0.2, 0.64 ],
					"buffername" : "audio2",
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 11.0,
					"grid" : 0.125,
					"id" : "obj-230",
					"labels" : -16,
					"maxclass" : "waveform~",
					"numinlets" : 5,
					"numoutlets" : 6,
					"outlettype" : [ "float", "float", "float", "float", "list", "" ],
					"patching_rect" : [ 554.400006413459778, 972.600001275539398, 490.0, 93.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 575.950012000000015, 443.356740217223773, 573.950012000000015, 124.0 ],
					"ruler" : -16,
					"selectioncolor" : [ 0.113725, 0.580392, 0.737255, 1.0 ],
					"setmode" : 3,
					"setunit" : 2,
					"ticks" : 8,
					"vticks" : 0
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"bgcolor2" : [ 0.129411764705882, 0.137254901960784, 0.149019607843137, 1.0 ],
					"bgfillcolor_angle" : 270.0,
					"bgfillcolor_autogradient" : 0.0,
					"bgfillcolor_color" : [ 0.2, 0.2, 0.2, 1.0 ],
					"bgfillcolor_color1" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"bgfillcolor_color2" : [ 0.129411764705882, 0.137254901960784, 0.149019607843137, 1.0 ],
					"bgfillcolor_proportion" : 0.5,
					"bgfillcolor_type" : "gradient",
					"fontname" : "Lucida Sans Typewriter ",
					"gradient" : 1,
					"id" : "obj-155",
					"maxclass" : "message",
					"numinlets" : 2,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"patching_rect" : [ 557.06489980220806, 772.389366328716278, 121.0, 21.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 1028.900024000000258, 7.15673981191226, 121.0, 21.0 ],
					"text" : "Zoom to selection"
				}

			}
, 			{
				"box" : 				{
					"id" : "obj-137",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 18.899999976158142, 879.700009107589722, 96.0, 19.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 576.950012000000015, 696.906739811912416, 44.0, 19.0 ],
					"text" : "File:"
				}

			}
, 			{
				"box" : 				{
					"fontname" : "Lucida Sans Typewriter ",
					"id" : "obj-162",
					"linecount" : 3,
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 1551.800010681152344, 751.804269419143566, 85.0, 45.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 575.950012000000015, 287.156739811912189, 190.0, 19.0 ],
					"text" : "Fill interpolation buffer->"
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"grad1" : [ 0.062745098039216, 0.066666666666667, 0.066666666666667, 1.0 ],
					"grad2" : [ 0.129411764705882, 0.137254901960784, 0.149019607843137, 1.0 ],
					"id" : "obj-209",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 11.782978653907776, 1596.44328373670578, 306.5, 16.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 0.0, 343.156739811912246, 573.950012000000015, 15.600000202655735 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"angle" : 270.0,
					"grad1" : [ 0.062745098039216, 0.066666666666667, 0.066666666666667, 1.0 ],
					"grad2" : [ 0.129411764705882, 0.137254901960784, 0.149019607843137, 1.0 ],
					"id" : "obj-211",
					"maxclass" : "panel",
					"mode" : 1,
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 243.282978653907776, 2028.776594877243042, 256.0, 16.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 15.0, 170.856739710584378, 558.950012000000015, 11.600000202655735 ],
					"proportion" : 0.5
				}

			}
, 			{
				"box" : 				{
					"bgcolor" : [ 0.196078431372549, 0.188235294117647, 0.2, 0.3 ],
					"elementcolor" : [ 0.588235294117647, 0.588235294117647, 0.588235294117647, 0.17 ],
					"floatoutput" : 1,
					"id" : "obj-40",
					"knobcolor" : [ 0.701960784313725, 0.415686274509804, 0.886274509803922, 0.59 ],
					"maxclass" : "slider",
					"min" : 1.0,
					"numinlets" : 1,
					"numoutlets" : 1,
					"outlettype" : [ "" ],
					"parameter_enable" : 0,
					"patching_rect" : [ 328.782978653907776, 1438.072344243526459, 490.0, 36.000000596046448 ],
					"presentation" : 1,
					"presentation_rect" : [ 576.950012000000015, 730.587120168430374, 572.950011999999788, 36.000000596046448 ],
					"prototypename" : "M4L.horizontal-orange",
					"size" : 9999.0
				}

			}
, 			{
				"box" : 				{
					"fontface" : 1,
					"fontname" : "Lucida Sans Typewriter ",
					"fontsize" : 16.0,
					"id" : "obj-45",
					"maxclass" : "comment",
					"numinlets" : 1,
					"numoutlets" : 0,
					"patching_rect" : [ 575.299994766712075, 1769.576611280441284, 259.0, 25.0 ],
					"presentation" : 1,
					"presentation_rect" : [ 702.29998235325229, 736.087120466453598, 426.0, 25.0 ],
					"text" : "Duration: 3.05"
				}

			}
 ],
		"lines" : [ 			{
				"patchline" : 				{
					"destination" : [ "obj-16", 0 ],
					"source" : [ "obj-10", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"source" : [ "obj-100", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-91", 0 ],
					"source" : [ "obj-103", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"source" : [ "obj-104", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"source" : [ "obj-108", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-113", 0 ],
					"source" : [ "obj-11", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 1 ],
					"source" : [ "obj-110", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"order" : 1,
					"source" : [ "obj-112", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-116", 0 ],
					"order" : 0,
					"source" : [ "obj-112", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-86", 0 ],
					"source" : [ "obj-112", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-113", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-115", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-115", 0 ],
					"source" : [ "obj-116", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"order" : 1,
					"source" : [ "obj-117", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-116", 0 ],
					"order" : 0,
					"source" : [ "obj-117", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-223", 1 ],
					"source" : [ "obj-119", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"source" : [ "obj-12", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-127", 0 ],
					"source" : [ "obj-120", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-134", 0 ],
					"source" : [ "obj-122", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-118", 0 ],
					"source" : [ "obj-123", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-118", 0 ],
					"source" : [ "obj-126", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-123", 0 ],
					"source" : [ "obj-127", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-126", 0 ],
					"source" : [ "obj-127", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-128", 0 ],
					"source" : [ "obj-129", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"source" : [ "obj-13", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-131", 0 ],
					"source" : [ "obj-130", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-128", 2 ],
					"source" : [ "obj-131", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-128", 3 ],
					"source" : [ "obj-131", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-129", 0 ],
					"source" : [ "obj-131", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-133", 0 ],
					"source" : [ "obj-131", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-134", 0 ],
					"source" : [ "obj-132", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-128", 0 ],
					"source" : [ "obj-133", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-82", 0 ],
					"source" : [ "obj-134", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-203", 0 ],
					"source" : [ "obj-136", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-228", 1 ],
					"source" : [ "obj-140", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-238", 0 ],
					"source" : [ "obj-140", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 1 ],
					"source" : [ "obj-140", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-157", 0 ],
					"source" : [ "obj-144", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-50", 0 ],
					"source" : [ "obj-144", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-140", 0 ],
					"source" : [ "obj-145", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-230", 1 ],
					"source" : [ "obj-149", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-230", 0 ],
					"source" : [ "obj-149", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-152", 1 ],
					"source" : [ "obj-151", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-182", 0 ],
					"source" : [ "obj-152", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-159", 0 ],
					"source" : [ "obj-154", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-159", 0 ],
					"source" : [ "obj-154", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-184", 2 ],
					"source" : [ "obj-154", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-165", 0 ],
					"source" : [ "obj-155", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-160", 1 ],
					"order" : 0,
					"source" : [ "obj-156", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"order" : 1,
					"source" : [ "obj-156", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-156", 0 ],
					"source" : [ "obj-157", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-118", 0 ],
					"source" : [ "obj-158", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-237", 0 ],
					"source" : [ "obj-159", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-205", 1 ],
					"source" : [ "obj-161", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-205", 0 ],
					"source" : [ "obj-161", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-253", 0 ],
					"source" : [ "obj-161", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-172", 1 ],
					"order" : 0,
					"source" : [ "obj-163", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-177", 0 ],
					"order" : 1,
					"source" : [ "obj-163", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-66", 0 ],
					"source" : [ "obj-164", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-152", 0 ],
					"source" : [ "obj-165", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-273", 0 ],
					"source" : [ "obj-167", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-274", 0 ],
					"source" : [ "obj-167", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-167", 0 ],
					"source" : [ "obj-168", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-151", 1 ],
					"source" : [ "obj-169", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-19", 0 ],
					"source" : [ "obj-17", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-24", 0 ],
					"source" : [ "obj-17", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-192", 0 ],
					"source" : [ "obj-170", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-177", 0 ],
					"source" : [ "obj-172", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-173", 0 ],
					"source" : [ "obj-174", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-169", 1 ],
					"source" : [ "obj-175", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-169", 0 ],
					"source" : [ "obj-175", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-151", 0 ],
					"source" : [ "obj-176", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-175", 0 ],
					"source" : [ "obj-176", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-174", 0 ],
					"source" : [ "obj-177", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-179", 0 ],
					"source" : [ "obj-178", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-185", 0 ],
					"source" : [ "obj-180", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-184", 0 ],
					"source" : [ "obj-181", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-196", 1 ],
					"source" : [ "obj-182", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-196", 0 ],
					"source" : [ "obj-182", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-136", 0 ],
					"source" : [ "obj-183", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-111", 0 ],
					"order" : 0,
					"source" : [ "obj-184", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-159", 1 ],
					"order" : 2,
					"source" : [ "obj-184", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-169", 0 ],
					"order" : 1,
					"source" : [ "obj-184", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-176", 0 ],
					"order" : 1,
					"source" : [ "obj-184", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-259", 0 ],
					"order" : 0,
					"source" : [ "obj-184", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-188", 0 ],
					"source" : [ "obj-185", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-184", 0 ],
					"order" : 2,
					"source" : [ "obj-186", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-196", 0 ],
					"order" : 3,
					"source" : [ "obj-186", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-218", 0 ],
					"order" : 0,
					"source" : [ "obj-186", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-230", 0 ],
					"order" : 1,
					"source" : [ "obj-186", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-187", 0 ],
					"source" : [ "obj-188", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-190", 0 ],
					"source" : [ "obj-189", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-191", 0 ],
					"source" : [ "obj-190", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-183", 0 ],
					"source" : [ "obj-192", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-203", 0 ],
					"source" : [ "obj-192", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-194", 0 ],
					"source" : [ "obj-193", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-196", 0 ],
					"source" : [ "obj-195", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-154", 0 ],
					"order" : 1,
					"source" : [ "obj-196", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-184", 4 ],
					"source" : [ "obj-196", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-89", 0 ],
					"order" : 0,
					"source" : [ "obj-196", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-198", 0 ],
					"source" : [ "obj-197", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-22", 0 ],
					"source" : [ "obj-198", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-200", 0 ],
					"source" : [ "obj-199", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-13", 1 ],
					"order" : 0,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-7", 0 ],
					"order" : 1,
					"source" : [ "obj-2", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-3", 0 ],
					"source" : [ "obj-20", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-48", 0 ],
					"source" : [ "obj-200", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-202", 0 ],
					"source" : [ "obj-201", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-199", 0 ],
					"source" : [ "obj-202", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-225", 0 ],
					"source" : [ "obj-203", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-193", 0 ],
					"source" : [ "obj-204", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-206", 1 ],
					"source" : [ "obj-205", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-206", 0 ],
					"source" : [ "obj-205", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-206", 1 ],
					"source" : [ "obj-208", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-206", 0 ],
					"source" : [ "obj-208", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-75", 0 ],
					"source" : [ "obj-21", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"source" : [ "obj-212", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-116", 0 ],
					"source" : [ "obj-213", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-212", 0 ],
					"source" : [ "obj-214", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-213", 0 ],
					"source" : [ "obj-214", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 2 ],
					"source" : [ "obj-215", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-235", 0 ],
					"source" : [ "obj-216", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-218", 0 ],
					"source" : [ "obj-217", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-171", 0 ],
					"order" : 3,
					"source" : [ "obj-218", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-216", 1 ],
					"order" : 2,
					"source" : [ "obj-218", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-242", 0 ],
					"order" : 0,
					"source" : [ "obj-218", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-243", 0 ],
					"order" : 0,
					"source" : [ "obj-218", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-25", 0 ],
					"order" : 1,
					"source" : [ "obj-218", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"order" : 1,
					"source" : [ "obj-218", 3 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-217", 0 ],
					"order" : 1,
					"source" : [ "obj-219", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-229", 0 ],
					"order" : 0,
					"source" : [ "obj-219", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-271", 0 ],
					"order" : 0,
					"source" : [ "obj-22", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 0 ],
					"order" : 1,
					"source" : [ "obj-22", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-216", 0 ],
					"source" : [ "obj-220", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-216", 0 ],
					"source" : [ "obj-220", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-218", 2 ],
					"source" : [ "obj-220", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-228", 0 ],
					"source" : [ "obj-223", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-214", 0 ],
					"source" : [ "obj-224", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-226", 0 ],
					"source" : [ "obj-225", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-87", 0 ],
					"source" : [ "obj-227", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"source" : [ "obj-228", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-230", 0 ],
					"source" : [ "obj-229", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-255", 0 ],
					"source" : [ "obj-23", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-218", 4 ],
					"source" : [ "obj-230", 5 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-220", 0 ],
					"order" : 1,
					"source" : [ "obj-230", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 0 ],
					"order" : 0,
					"source" : [ "obj-230", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-208", 1 ],
					"source" : [ "obj-233", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-208", 0 ],
					"source" : [ "obj-233", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-252", 0 ],
					"source" : [ "obj-233", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 0 ],
					"source" : [ "obj-235", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 0 ],
					"source" : [ "obj-237", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"source" : [ "obj-238", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-107", 0 ],
					"source" : [ "obj-24", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-244", 0 ],
					"source" : [ "obj-240", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-240", 2 ],
					"source" : [ "obj-241", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-240", 1 ],
					"source" : [ "obj-242", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-241", 1 ],
					"source" : [ "obj-242", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-240", 0 ],
					"source" : [ "obj-243", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-241", 0 ],
					"source" : [ "obj-243", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-245", 1 ],
					"source" : [ "obj-244", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-233", 0 ],
					"source" : [ "obj-245", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-245", 0 ],
					"source" : [ "obj-246", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-248", 0 ],
					"source" : [ "obj-246", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-233", 0 ],
					"source" : [ "obj-248", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-32", 0 ],
					"source" : [ "obj-25", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 0 ],
					"source" : [ "obj-25", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"source" : [ "obj-252", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-253", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-161", 0 ],
					"source" : [ "obj-254", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-254", 0 ],
					"source" : [ "obj-255", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-258", 0 ],
					"source" : [ "obj-255", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-258", 1 ],
					"source" : [ "obj-256", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-256", 0 ],
					"source" : [ "obj-257", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-161", 0 ],
					"source" : [ "obj-258", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-60", 0 ],
					"source" : [ "obj-26", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-132", 0 ],
					"order" : 0,
					"source" : [ "obj-260", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-263", 0 ],
					"order" : 1,
					"source" : [ "obj-260", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-132", 0 ],
					"order" : 0,
					"source" : [ "obj-261", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-262", 0 ],
					"order" : 1,
					"source" : [ "obj-261", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-257", 0 ],
					"source" : [ "obj-262", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-264", 0 ],
					"source" : [ "obj-262", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-257", 1 ],
					"source" : [ "obj-263", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-264", 1 ],
					"source" : [ "obj-263", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-257", 2 ],
					"source" : [ "obj-264", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-268", 0 ],
					"source" : [ "obj-265", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-82", 1 ],
					"source" : [ "obj-268", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-170", 0 ],
					"source" : [ "obj-272", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 0 ],
					"source" : [ "obj-274", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-279", 0 ],
					"source" : [ "obj-276", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-278", 0 ],
					"source" : [ "obj-277", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 0 ],
					"source" : [ "obj-278", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 0 ],
					"source" : [ "obj-278", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-95", 2 ],
					"source" : [ "obj-279", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-237", 0 ],
					"source" : [ "obj-280", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-279", 1 ],
					"source" : [ "obj-280", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-279", 0 ],
					"source" : [ "obj-280", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-235", 0 ],
					"source" : [ "obj-281", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-282", 1 ],
					"source" : [ "obj-281", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-282", 0 ],
					"source" : [ "obj-281", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-77", 2 ],
					"source" : [ "obj-282", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-282", 0 ],
					"source" : [ "obj-283", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-289", 0 ],
					"source" : [ "obj-288", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-93", 0 ],
					"source" : [ "obj-29", 6 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-288", 0 ],
					"source" : [ "obj-291", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"source" : [ "obj-294", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-143", 0 ],
					"source" : [ "obj-31", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 1 ],
					"source" : [ "obj-32", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-35", 0 ],
					"source" : [ "obj-32", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-31", 0 ],
					"source" : [ "obj-33", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-34", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-59", 1 ],
					"source" : [ "obj-35", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-164", 0 ],
					"order" : 0,
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"order" : 1,
					"source" : [ "obj-36", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 0 ],
					"source" : [ "obj-37", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-238", 1 ],
					"order" : 1,
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-53", 0 ],
					"order" : 2,
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-58", 0 ],
					"order" : 0,
					"source" : [ "obj-38", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-42", 0 ],
					"source" : [ "obj-39", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-4", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-51", 0 ],
					"source" : [ "obj-40", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-4", 0 ],
					"source" : [ "obj-41", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-90", 0 ],
					"source" : [ "obj-41", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-43", 0 ],
					"source" : [ "obj-44", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-164", 0 ],
					"source" : [ "obj-46", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-36", 1 ],
					"source" : [ "obj-46", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-39", 0 ],
					"source" : [ "obj-46", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-197", 0 ],
					"order" : 0,
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"order" : 1,
					"source" : [ "obj-47", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-197", 0 ],
					"source" : [ "obj-48", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-44", 0 ],
					"source" : [ "obj-48", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-47", 1 ],
					"source" : [ "obj-48", 2 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-12", 1 ],
					"order" : 0,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-6", 0 ],
					"order" : 1,
					"source" : [ "obj-5", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-45", 0 ],
					"source" : [ "obj-50", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"source" : [ "obj-51", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-37", 0 ],
					"source" : [ "obj-52", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-54", 0 ],
					"source" : [ "obj-53", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-57", 1 ],
					"order" : 0,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"order" : 1,
					"source" : [ "obj-54", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-149", 0 ],
					"source" : [ "obj-55", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-64", 0 ],
					"source" : [ "obj-57", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-119", 0 ],
					"order" : 0,
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-144", 0 ],
					"order" : 1,
					"source" : [ "obj-58", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-122", 0 ],
					"order" : 0,
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-55", 1 ],
					"order" : 1,
					"source" : [ "obj-59", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-41", 0 ],
					"source" : [ "obj-6", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-1", 0 ],
					"source" : [ "obj-60", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-234", 1 ],
					"order" : 0,
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-49", 0 ],
					"order" : 1,
					"source" : [ "obj-61", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-246", 0 ],
					"source" : [ "obj-63", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-61", 1 ],
					"source" : [ "obj-64", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-186", 0 ],
					"source" : [ "obj-65", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-29", 0 ],
					"source" : [ "obj-66", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-71", 0 ],
					"source" : [ "obj-68", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-8", 0 ],
					"source" : [ "obj-7", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-103", 0 ],
					"source" : [ "obj-70", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-28", 0 ],
					"source" : [ "obj-71", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-79", 0 ],
					"source" : [ "obj-72", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-224", 0 ],
					"source" : [ "obj-75", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-85", 0 ],
					"source" : [ "obj-75", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-230", 2 ],
					"source" : [ "obj-77", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-76", 0 ],
					"source" : [ "obj-78", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-27", 0 ],
					"source" : [ "obj-8", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-70", 0 ],
					"source" : [ "obj-80", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-23", 0 ],
					"source" : [ "obj-82", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-63", 0 ],
					"source" : [ "obj-82", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-181", 0 ],
					"order" : 1,
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-195", 0 ],
					"order" : 0,
					"source" : [ "obj-84", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-112", 0 ],
					"source" : [ "obj-85", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-11", 0 ],
					"order" : 1,
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-116", 0 ],
					"order" : 0,
					"source" : [ "obj-86", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-38", 0 ],
					"source" : [ "obj-87", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-40", 0 ],
					"source" : [ "obj-87", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-89", 1 ],
					"source" : [ "obj-88", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-89", 0 ],
					"source" : [ "obj-88", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-184", 3 ],
					"order" : 0,
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-196", 3 ],
					"order" : 1,
					"source" : [ "obj-89", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-17", 0 ],
					"source" : [ "obj-9", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-46", 0 ],
					"source" : [ "obj-91", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-280", 0 ],
					"order" : 1,
					"source" : [ "obj-92", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-88", 0 ],
					"order" : 0,
					"source" : [ "obj-92", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-33", 1 ],
					"source" : [ "obj-94", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-196", 2 ],
					"source" : [ "obj-95", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-281", 0 ],
					"order" : 1,
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-98", 0 ],
					"order" : 0,
					"source" : [ "obj-97", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 1 ],
					"source" : [ "obj-98", 1 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-99", 0 ],
					"source" : [ "obj-98", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-218", 3 ],
					"order" : 0,
					"source" : [ "obj-99", 0 ]
				}

			}
, 			{
				"patchline" : 				{
					"destination" : [ "obj-230", 3 ],
					"order" : 1,
					"source" : [ "obj-99", 0 ]
				}

			}
 ],
		"parameters" : 		{
			"obj-205::obj-113" : [ "pan", "Pan", 0 ],
			"obj-205::obj-116" : [ "gain", "Gain", 0 ],
			"obj-63" : [ "live.text[2]", "live.text", 0 ],
			"obj-208::obj-114" : [ "solo[1]", "Solo", 0 ],
			"obj-205::obj-4" : [ "setname", "Setname", 0 ],
			"obj-208::obj-115" : [ "active[1]", "Active", 0 ],
			"obj-205::obj-114" : [ "solo", "Solo", 0 ],
			"obj-291" : [ "number", "number", 0 ],
			"obj-208::obj-30" : [ "qlist[1]", "Qlist", 0 ],
			"obj-206::obj-24" : [ "output", "Output", 0 ],
			"obj-208::obj-113" : [ "pan[1]", "Pan", 0 ],
			"obj-208::obj-116" : [ "gain[1]", "Gain", 0 ],
			"obj-205::obj-115" : [ "active", "Active", 0 ],
			"obj-205::obj-30" : [ "qlist", "Qlist", 0 ],
			"obj-208::obj-4" : [ "setname[1]", "Setname", 0 ],
			"obj-23" : [ "live.text[1]", "live.text", 0 ],
			"parameterbanks" : 			{

			}
,
			"parameter_overrides" : 			{
				"obj-208::obj-114" : 				{
					"parameter_longname" : "solo[1]"
				}
,
				"obj-208::obj-115" : 				{
					"parameter_longname" : "active[1]"
				}
,
				"obj-208::obj-30" : 				{
					"parameter_longname" : "qlist[1]"
				}
,
				"obj-208::obj-113" : 				{
					"parameter_longname" : "pan[1]"
				}
,
				"obj-208::obj-116" : 				{
					"parameter_longname" : "gain[1]"
				}

			}

		}
,
		"dependency_cache" : [ 			{
				"name" : "wfmodes.png",
				"bootpath" : "C74:/media/max/picts",
				"type" : "PNG",
				"implicit" : 1
			}
, 			{
				"name" : "wfknob.png",
				"bootpath" : "C74:/media/max/picts",
				"type" : "PNG",
				"implicit" : 1
			}
, 			{
				"name" : "AudioMix.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/AudioMix/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "AudioOutput.maxpat",
				"bootpath" : "~/Documents/Max 8/Packages/AudioMix/patchers",
				"type" : "JSON",
				"implicit" : 1
			}
, 			{
				"name" : "logo.png",
				"bootpath" : "D:/my_workspace/latent-timbre-synthesis/app/interpolate_two",
				"patcherrelativepath" : ".",
				"type" : "PNG",
				"implicit" : 1
			}
 ],
		"autosave" : 0,
		"styles" : [ 			{
				"name" : "AudioStatus_Menu",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "color",
						"color" : [ 0.294118, 0.313726, 0.337255, 1 ],
						"color1" : [ 0.454902, 0.462745, 0.482353, 0.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}

				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "Audiomix",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color1" : [ 0.376471, 0.384314, 0.4, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39
					}

				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "Jamoma_highlighted_orange",
				"default" : 				{
					"accentcolor" : [ 1.0, 0.5, 0.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "Max 12 Regular",
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "jpatcher001",
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "messageGreen-1",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.165741, 0.364658, 0.14032, 0.74 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}

				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "messagegold",
				"default" : 				{
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.764706, 0.592157, 0.101961, 0.74 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}

				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjBlue-1",
				"default" : 				{
					"accentcolor" : [ 0.317647, 0.654902, 0.976471, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "newobjYellow-1",
				"default" : 				{
					"fontsize" : [ 12.059008 ],
					"accentcolor" : [ 0.82517, 0.78181, 0.059545, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"fontsize" : [ 11.0 ],
					"locked_bgcolor" : [ 0.129411764705882, 0.137254901960784, 0.149019607843137, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Lucida Sans Typewriter " ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color1" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
						"color2" : [ 0.129411764705882, 0.137254901960784, 0.149019607843137, 1.0 ],
						"color" : [ 0.2, 0.2, 0.2, 1.0 ],
						"angle" : 270.0,
						"autogradient" : 0.0,
						"proportion" : 0.5
					}
,
					"editing_bgcolor" : [ 0.129411764705882, 0.137254901960784, 0.149019607843137, 1.0 ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"fontsize" : [ 11.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1-1-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1-1-1-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1-1-1-1-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1-1-1-1-1-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1-1-1-1-2",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1-1-1-2",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1-1-1-2-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1-1-2",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1-1-3",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1-1-4",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1-1-4-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1-1-5",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1-2",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1-3",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1-4",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1-5",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1-5-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-1-6",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-2",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-3",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-4",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-5",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-5-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-1-6",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-2",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-3",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-4",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-4-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-4-1-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-4-1-1-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-4-1-2",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-4-2",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-4-2-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-5",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-6",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"selectioncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-6-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"fontsize" : [ 11.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-6-1-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"selectioncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-6-2",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"selectioncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-6-3",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"selectioncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-7",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-1-7-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"fontsize" : [ 11.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-10",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-11",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-12",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-13",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-14",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-15",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-16",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-17",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-18",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-19",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-2",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"fontsize" : [ 11.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-2-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-2-1-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"fontsize" : [ 11.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-2-1-1-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-2-1-2",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-2-2",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-2-2-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"fontsize" : [ 11.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-20",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-21",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"fontsize" : [ 11.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-21-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-22",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-3",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"fontsize" : [ 11.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-3-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-3-1-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-3-1-1-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-3-1-1-1-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-3-1-1-2",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-3-1-2",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-3-1-2-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-3-2",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-3-2-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"fontsize" : [ 11.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-3-3",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"fontsize" : [ 11.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-4",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"fontsize" : [ 11.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-4-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-4-1-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"fontsize" : [ 11.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-4-1-1-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-4-1-2",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-4-2",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-4-2-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"fontsize" : [ 11.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-5",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgfillcolor" : 					{
						"type" : "gradient",
						"color" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"color1" : [ 0.372549, 0.196078, 0.486275, 1.0 ],
						"color2" : [ 0.290196, 0.309804, 0.301961, 1.0 ],
						"angle" : 270.0,
						"proportion" : 0.39,
						"autogradient" : 0
					}
,
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-6",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-7",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-7-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"selectioncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-8",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-8-1",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"selectioncolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
, 			{
				"name" : "tatarism-9",
				"default" : 				{
					"elementcolor" : [ 0.589653, 0.589635, 0.589645, 1.0 ],
					"textcolor_inverse" : [ 0.862745, 0.870588, 0.878431, 1.0 ],
					"color" : [ 0.701961, 0.415686, 0.886275, 1.0 ],
					"fontname" : [ "Futura Medium" ],
					"bgcolor" : [ 0.19771, 0.188048, 0.201856, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ]
				}
,
				"parentstyle" : "",
				"multi" : 0
			}
 ]
	}

}
