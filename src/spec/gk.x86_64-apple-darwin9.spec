[
{ "tag": "enum", "ns": 0, "name": "gk_impl", "id": 0, "location": "/usr/local/include/gk/gk.h:21:14", "fields": [{ "tag": "field", "name": "GK_GL2", "value": 0 }, { "tag": "field", "name": "GK_GL3", "value": 1 }] },
{ "tag": "typedef", "ns": 0, "name": "gk_impl", "location": "/usr/local/include/gk/gk.h:24:3", "type": { "tag": ":enum", "name": "gk_impl", "id": 0 } },
{ "tag": "enum", "ns": 0, "name": "gk_cmd_type", "id": 0, "location": "/usr/local/include/gk/gk.h:26:14", "fields": [{ "tag": "field", "name": "GK_CMD_NULL", "value": 0 }, { "tag": "field", "name": "GK_CMD_LIST", "value": 1 }, { "tag": "field", "name": "GK_CMD_PASS", "value": 2 }, { "tag": "field", "name": "GK_CMD_PATH", "value": 3 }, { "tag": "field", "name": "GK_CMD_FONT_CREATE", "value": 4 }, { "tag": "field", "name": "GK_CMD_FONT_STYLE", "value": 5 }, { "tag": "field", "name": "GK_CMD_FONT_FACE", "value": 6 }, { "tag": "field", "name": "GK_CMD_TEXT", "value": 7 }, { "tag": "field", "name": "GK_CMD_IMAGE_CREATE", "value": 8 }, { "tag": "field", "name": "GK_CMD_TF_TRS", "value": 9 }, { "tag": "field", "name": "GK_CMD_TF_ORTHO", "value": 10 }, { "tag": "field", "name": "GK_CMD_QUAD", "value": 11 }, { "tag": "field", "name": "GK_CMD_QUADSPRITE", "value": 12 }, { "tag": "field", "name": "GK_CMD_B2D_WORLD", "value": 13 }, { "tag": "field", "name": "GK_CMD_SPRITESHEET_CREATE", "value": 14 }, { "tag": "field", "name": "GK_CMD_SPRITESHEET_DESTROY", "value": 15 }] },
{ "tag": "typedef", "ns": 0, "name": "gk_cmd_type", "location": "/usr/local/include/gk/gk.h:51:3", "type": { "tag": ":enum", "name": "gk_cmd_type", "id": 0 } },
{ "tag": "enum", "ns": 0, "name": "gk_subsystem", "id": 0, "location": "/usr/local/include/gk/gk.h:53:14", "fields": [{ "tag": "field", "name": "GK_SUB_NULL", "value": 0 }, { "tag": "field", "name": "GK_SUB_CONFIG", "value": 1 }, { "tag": "field", "name": "GK_SUB_GL", "value": 2 }, { "tag": "field", "name": "GK_SUB_NVG", "value": 3 }] },
{ "tag": "typedef", "ns": 0, "name": "gk_subsystem", "location": "/usr/local/include/gk/gk.h:58:3", "type": { "tag": ":enum", "name": "gk_subsystem", "id": 0 } },
{ "tag": "struct", "ns": 0, "name": "gk_vec2", "id": 0, "location": "/usr/local/include/gk/gk.h:70:16", "bit-size": 64, "bit-alignment": 32, "fields": [{ "tag": "field", "name": "x", "bit-offset": 0, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "y", "bit-offset": 32, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_vec2", "location": "/usr/local/include/gk/gk.h:75:3", "type": { "tag": ":struct", "name": "gk_vec2", "id": 1 } },
{ "tag": "struct", "ns": 0, "name": "gk_vec3", "id": 0, "location": "/usr/local/include/gk/gk.h:77:16", "bit-size": 96, "bit-alignment": 32, "fields": [{ "tag": "field", "name": "x", "bit-offset": 0, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "y", "bit-offset": 32, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "z", "bit-offset": 64, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_vec3", "location": "/usr/local/include/gk/gk.h:82:3", "type": { "tag": ":struct", "name": "gk_vec3", "id": 2 } },
{ "tag": "struct", "ns": 0, "name": "gk_vec4", "id": 0, "location": "/usr/local/include/gk/gk.h:84:16", "bit-size": 128, "bit-alignment": 32, "fields": [{ "tag": "field", "name": "x", "bit-offset": 0, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "y", "bit-offset": 32, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "z", "bit-offset": 64, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "w", "bit-offset": 96, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_vec4", "location": "/usr/local/include/gk/gk.h:89:3", "type": { "tag": ":struct", "name": "gk_vec4", "id": 3 } },
{ "tag": "union", "ns": 0, "name": "gk_mat4", "id": 0, "location": "/usr/local/include/gk/gk.h:91:15", "bit-size": 512, "bit-alignment": 32, "fields": [{ "tag": "field", "name": "data", "bit-offset": 0, "bit-size": 512, "bit-alignment": 32, "type": { "tag": ":array", "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 }, "size": 16 } }, { "tag": "field", "name": "v", "bit-offset": 0, "bit-size": 512, "bit-alignment": 32, "type": { "tag": "struct", "ns": 0, "name": "", "id": 4, "location": "/usr/local/include/gk/gk.h:94:5", "bit-size": 512, "bit-alignment": 32, "fields": [{ "tag": "field", "name": "a00", "bit-offset": 0, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "a01", "bit-offset": 32, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "a02", "bit-offset": 64, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "a03", "bit-offset": 96, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "a10", "bit-offset": 128, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "a11", "bit-offset": 160, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "a12", "bit-offset": 192, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "a13", "bit-offset": 224, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "a20", "bit-offset": 256, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "a21", "bit-offset": 288, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "a22", "bit-offset": 320, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "a23", "bit-offset": 352, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "a30", "bit-offset": 384, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "a31", "bit-offset": 416, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "a32", "bit-offset": 448, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "a33", "bit-offset": 480, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }] } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_mat4", "location": "/usr/local/include/gk/gk.h:102:3", "type": { "tag": ":union", "name": "gk_mat4", "id": 5 } },
{ "tag": "struct", "ns": 0, "name": "gk_cmd", "id": 0, "location": "/usr/local/include/gk/gk.h:104:16", "bit-size": 64, "bit-alignment": 32, "fields": [{ "tag": "field", "name": "type", "bit-offset": 0, "bit-size": 32, "bit-alignment": 32, "type": { "tag": "gk_cmd_type" } }, { "tag": "field", "name": "key", "bit-offset": 32, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_cmd", "location": "/usr/local/include/gk/gk.h:107:3", "type": { "tag": ":struct", "name": "gk_cmd", "id": 6 } },
{ "tag": "struct", "ns": 0, "name": "gk_list", "id": 0, "location": "/usr/local/include/gk/gk.h:113:16", "bit-size": 192, "bit-alignment": 64, "fields": [{ "tag": "field", "name": "sub", "bit-offset": 0, "bit-size": 32, "bit-alignment": 32, "type": { "tag": "gk_subsystem" } }, { "tag": "field", "name": "ncmds", "bit-offset": 32, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":unsigned-int", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "cmds", "bit-offset": 64, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": ":pointer", "type": { "tag": "gk_cmd" } } } }, { "tag": "field", "name": "in_use", "bit-offset": 128, "bit-size": 8, "bit-alignment": 8, "type": { "tag": ":char", "bit-size": 8, "bit-alignment": 8 } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_list", "location": "/usr/local/include/gk/gk.h:121:3", "type": { "tag": ":struct", "name": "gk_list", "id": 7 } },
{ "tag": "enum", "ns": 0, "name": "gk_pass_sorting", "id": 0, "location": "/usr/local/include/gk/gk.h:125:14", "fields": [{ "tag": "field", "name": "GK_PASS_SORT_NONE", "value": 0 }, { "tag": "field", "name": "GK_PASS_SORT_ASC", "value": 1 }, { "tag": "field", "name": "GK_PASS_SORT_DESC", "value": 2 }, { "tag": "field", "name": "GK_PASS_SORT_STABLE_ASC", "value": 3 }, { "tag": "field", "name": "GK_PASS_SORT_STABLE_DESC", "value": 4 }] },
{ "tag": "typedef", "ns": 0, "name": "gk_pass_sorting", "location": "/usr/local/include/gk/gk.h:131:3", "type": { "tag": ":enum", "name": "gk_pass_sorting", "id": 0 } },
{ "tag": "struct", "ns": 0, "name": "gk_pass", "id": 0, "location": "/usr/local/include/gk/gk.h:133:16", "bit-size": 128, "bit-alignment": 32, "fields": [{ "tag": "field", "name": "parent", "bit-offset": 0, "bit-size": 64, "bit-alignment": 32, "type": { "tag": "gk_cmd" } }, { "tag": "field", "name": "sort", "bit-offset": 64, "bit-size": 32, "bit-alignment": 32, "type": { "tag": "gk_pass_sorting" } }, { "tag": "field", "name": "list_index", "bit-offset": 96, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":unsigned-int", "bit-size": 32, "bit-alignment": 32 } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_pass", "location": "/usr/local/include/gk/gk.h:137:3", "type": { "tag": ":struct", "name": "gk_pass", "id": 8 } },
{ "tag": "enum", "ns": 0, "name": "gk_error_code", "id": 0, "location": "/usr/local/include/gk/gk.h:142:14", "fields": [{ "tag": "field", "name": "GK_ERROR_NONE", "value": 0 }, { "tag": "field", "name": "GK_ERROR_LIST_RECURSION", "value": 1 }, { "tag": "field", "name": "GK_ERROR_LIST_UNKNOWN", "value": 2 }, { "tag": "field", "name": "GK_ERROR_LIST_CORRUPT", "value": 3 }, { "tag": "field", "name": "GK_ERROR_PASS_BADLIST", "value": 4 }, { "tag": "field", "name": "GK_ERROR_CMD_UNKNOWN", "value": 5 }, { "tag": "field", "name": "GK_ERROR_SSF_UNKNOWN", "value": 6 }, { "tag": "field", "name": "GK_ERROR_MAX", "value": 7 }] },
{ "tag": "typedef", "ns": 0, "name": "gk_error_code", "location": "/usr/local/include/gk/gk.h:161:3", "type": { "tag": ":enum", "name": "gk_error_code", "id": 0 } },
{ "tag": "struct", "ns": 0, "name": "gk_error", "id": 0, "location": "/usr/local/include/gk/gk.h:163:16", "bit-size": 128, "bit-alignment": 64, "fields": [{ "tag": "field", "name": "code", "bit-offset": 0, "bit-size": 32, "bit-alignment": 32, "type": { "tag": "gk_error_code" } }, { "tag": "field", "name": "message", "bit-offset": 64, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": ":char", "bit-size": 8, "bit-alignment": 8 } } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_error", "location": "/usr/local/include/gk/gk.h:166:3", "type": { "tag": ":struct", "name": "gk_error", "id": 9 } },
{ "tag": "struct", "ns": 0, "name": "gk_bundle", "id": 0, "location": "/usr/local/include/gk/gk.h:168:16", "bit-size": 384, "bit-alignment": 64, "fields": [{ "tag": "field", "name": "start", "bit-offset": 0, "bit-size": 128, "bit-alignment": 32, "type": { "tag": "gk_pass" } }, { "tag": "field", "name": "lists", "bit-offset": 128, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": ":pointer", "type": { "tag": "gk_list" } } } }, { "tag": "field", "name": "nlists", "bit-offset": 192, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":unsigned-int", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "error", "bit-offset": 256, "bit-size": 128, "bit-alignment": 64, "type": { "tag": "gk_error" } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_bundle", "location": "/usr/local/include/gk/gk.h:174:3", "type": { "tag": ":struct", "name": "gk_bundle", "id": 10 } },
{ "tag": "struct", "ns": 0, "name": "gk_context", "id": 0, "location": "/usr/local/include/gk/gk.h:176:16", "bit-size": 0, "bit-alignment": 0, "fields": [] },
{ "tag": "typedef", "ns": 0, "name": "gk_context", "location": "/usr/local/include/gk/gk.h:176:27", "type": { "tag": "struct", "ns": 1818455657, "name": "gk_context", "id": 0, "location": "/usr/local/include/gk/gk.h:176:16", "bit-size": 0, "bit-alignment": 0, "fields": [] } },
{ "tag": "function", "name": "gk_create", "ns": 0, "location": "/usr/local/include/gk/gk.h:182:13", "variadic": false, "inline": false, "storage-class": "none", "parameters": [{ "tag": "parameter", "name": "impl", "type": { "tag": "gk_impl" } }], "return-type": { "tag": ":pointer", "type": { "tag": "gk_context" } } },
{ "tag": "function", "name": "gk_destroy", "ns": 0, "location": "/usr/local/include/gk/gk.h:183:6", "variadic": false, "inline": false, "storage-class": "none", "parameters": [{ "tag": "parameter", "name": "gk", "type": { "tag": ":pointer", "type": { "tag": "gk_context" } } }], "return-type": { "tag": ":void" } },
{ "tag": "function", "name": "gk_process", "ns": 0, "location": "/usr/local/include/gk/gk.h:184:6", "variadic": false, "inline": false, "storage-class": "none", "parameters": [{ "tag": "parameter", "name": "gk", "type": { "tag": ":pointer", "type": { "tag": "gk_context" } } }, { "tag": "parameter", "name": "bundle", "type": { "tag": ":pointer", "type": { "tag": "gk_bundle" } } }], "return-type": { "tag": ":void" } },
{ "tag": "enum", "ns": 0, "name": "gk_pathdef_cmds", "id": 0, "location": "/usr/local/include/gk/gk.h:202:14", "fields": [{ "tag": "field", "name": "GK_PATH_BEGIN", "value": 0 }, { "tag": "field", "name": "GK_PATH_END", "value": 1 }, { "tag": "field", "name": "GK_PATH_RECT", "value": 2 }, { "tag": "field", "name": "GK_PATH_CIRCLE", "value": 3 }, { "tag": "field", "name": "GK_PATH_WINDING", "value": 4 }, { "tag": "field", "name": "GK_PATH_STROKE_COLOR_RGBA", "value": 5 }, { "tag": "field", "name": "GK_PATH_STROKE_COLOR_RGBAF", "value": 6 }, { "tag": "field", "name": "GK_PATH_MITER_LIMIT", "value": 7 }, { "tag": "field", "name": "GK_PATH_STROKE_WIDTH", "value": 8 }, { "tag": "field", "name": "GK_PATH_LINE_CAP", "value": 9 }, { "tag": "field", "name": "GK_PATH_LINE_JOIN", "value": 10 }, { "tag": "field", "name": "GK_PATH_FILL_COLOR_RGBA", "value": 11 }, { "tag": "field", "name": "GK_PATH_FILL_COLOR_RGBAF", "value": 12 }, { "tag": "field", "name": "GK_PATH_FILL", "value": 13 }, { "tag": "field", "name": "GK_PATH_STROKE", "value": 14 }, { "tag": "field", "name": "GK_PATH_TF_IDENTITY", "value": 15 }, { "tag": "field", "name": "GK_PATH_TF_TRANSLATE", "value": 16 }, { "tag": "field", "name": "GK_PATH_TF_ROTATE", "value": 17 }, { "tag": "field", "name": "GK_PATH_TF_SCALE", "value": 18 }, { "tag": "field", "name": "GK_PATH_TF_SKEW_X", "value": 19 }, { "tag": "field", "name": "GK_PATH_TF_SKEW_Y", "value": 20 }] },
{ "tag": "typedef", "ns": 0, "name": "gk_pathdef_cmds", "location": "/usr/local/include/gk/gk.h:230:3", "type": { "tag": ":enum", "name": "gk_pathdef_cmds", "id": 0 } },
{ "tag": "enum", "ns": 0, "name": "gk_pathdef_winding", "id": 0, "location": "/usr/local/include/gk/gk.h:233:14", "fields": [{ "tag": "field", "name": "GK_WINDING_CCW", "value": 1 }, { "tag": "field", "name": "GK_WINDING_SOLID", "value": 1 }, { "tag": "field", "name": "GK_WINDING_CW", "value": 2 }, { "tag": "field", "name": "GK_WINDING_HOLE", "value": 2 }] },
{ "tag": "typedef", "ns": 0, "name": "gk_pathdef_winding", "location": "/usr/local/include/gk/gk.h:239:3", "type": { "tag": ":enum", "name": "gk_pathdef_winding", "id": 0 } },
{ "tag": "enum", "ns": 0, "name": "gk_pathdef_linecap", "id": 0, "location": "/usr/local/include/gk/gk.h:242:14", "fields": [{ "tag": "field", "name": "GK_LINECAP_BUTT", "value": 0 }, { "tag": "field", "name": "GK_LINECAP_ROUND", "value": 1 }, { "tag": "field", "name": "GK_LINECAP_SQUARE", "value": 2 }, { "tag": "field", "name": "GK_LINECAP_BEVEL", "value": 3 }, { "tag": "field", "name": "GK_LINECAP_MITER", "value": 4 }] },
{ "tag": "typedef", "ns": 0, "name": "gk_pathdef_linecap", "location": "/usr/local/include/gk/gk.h:248:3", "type": { "tag": ":enum", "name": "gk_pathdef_linecap", "id": 0 } },
{ "tag": "enum", "ns": 0, "name": "gk_image_flags", "id": 0, "location": "/usr/local/include/gk/gk.h:250:14", "fields": [{ "tag": "field", "name": "GK_IMG_GENERATE_MIPMAPS", "value": 1 }, { "tag": "field", "name": "GK_IMG_REPEATX", "value": 2 }, { "tag": "field", "name": "GK_IMG_REPEATY", "value": 4 }, { "tag": "field", "name": "GK_IMG_FLIPY", "value": 8 }, { "tag": "field", "name": "GK_IMG_PREMULTIPLIED", "value": 16 }] },
{ "tag": "typedef", "ns": 0, "name": "gk_image_flags", "location": "/usr/local/include/gk/gk.h:257:3", "type": { "tag": ":enum", "name": "gk_image_flags", "id": 0 } },
{ "tag": "enum", "ns": 0, "name": "gk_image_filter", "id": 0, "location": "/usr/local/include/gk/gk.h:262:14", "fields": [{ "tag": "field", "name": "GK_IMG_FILTER_NEAREST", "value": 0 }, { "tag": "field", "name": "GK_IMG_FILTER_LINEAR", "value": 1 }, { "tag": "field", "name": "GK_IMG_FILTER_NEAREST_MIPMAP_NEAREST", "value": 2 }, { "tag": "field", "name": "GK_IMG_FILTER_LINEAR_MIPMAP_NEAREST", "value": 3 }, { "tag": "field", "name": "GK_IMG_FILTER_NEAREST_MIPMAP_LINEAR", "value": 4 }, { "tag": "field", "name": "GK_IMG_FILTER_LINEAR_MIPMAP_LINEAR", "value": 5 }] },
{ "tag": "typedef", "ns": 0, "name": "gk_image_filter", "location": "/usr/local/include/gk/gk.h:270:3", "type": { "tag": ":enum", "name": "gk_image_filter", "id": 0 } },
{ "tag": "struct", "ns": 0, "name": "gk_cmd_path", "id": 0, "location": "/usr/local/include/gk/gk.h:272:16", "bit-size": 192, "bit-alignment": 64, "fields": [{ "tag": "field", "name": "parent", "bit-offset": 0, "bit-size": 64, "bit-alignment": 32, "type": { "tag": "gk_cmd" } }, { "tag": "field", "name": "pathdef", "bit-offset": 64, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } } }, { "tag": "field", "name": "pathlen", "bit-offset": 128, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":unsigned-int", "bit-size": 32, "bit-alignment": 32 } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_cmd_path", "location": "/usr/local/include/gk/gk.h:277:3", "type": { "tag": ":struct", "name": "gk_cmd_path", "id": 12 } },
{ "tag": "struct", "ns": 0, "name": "gk_list_nvg", "id": 0, "location": "/usr/local/include/gk/gk.h:282:16", "bit-size": 320, "bit-alignment": 64, "fields": [{ "tag": "field", "name": "parent", "bit-offset": 0, "bit-size": 192, "bit-alignment": 64, "type": { "tag": "gk_list" } }, { "tag": "field", "name": "width", "bit-offset": 192, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "height", "bit-offset": 224, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "ratio", "bit-offset": 256, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_list_nvg", "location": "/usr/local/include/gk/gk.h:288:3", "type": { "tag": ":struct", "name": "gk_list_nvg", "id": 13 } },
{ "tag": "struct", "ns": 0, "name": "gk_cmd_font_create", "id": 0, "location": "/usr/local/include/gk/gk.h:290:16", "bit-size": 256, "bit-alignment": 64, "fields": [{ "tag": "field", "name": "parent", "bit-offset": 0, "bit-size": 64, "bit-alignment": 32, "type": { "tag": "gk_cmd" } }, { "tag": "field", "name": "name", "bit-offset": 64, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": ":char", "bit-size": 8, "bit-alignment": 8 } } }, { "tag": "field", "name": "filename", "bit-offset": 128, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": ":char", "bit-size": 8, "bit-alignment": 8 } } }, { "tag": "field", "name": "id", "bit-offset": 192, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_cmd_font_create", "location": "/usr/local/include/gk/gk.h:298:3", "type": { "tag": ":struct", "name": "gk_cmd_font_create", "id": 14 } },
{ "tag": "struct", "ns": 0, "name": "gk_cmd_image_create", "id": 0, "location": "/usr/local/include/gk/gk.h:300:16", "bit-size": 256, "bit-alignment": 64, "fields": [{ "tag": "field", "name": "parent", "bit-offset": 0, "bit-size": 64, "bit-alignment": 32, "type": { "tag": "gk_cmd" } }, { "tag": "field", "name": "filename", "bit-offset": 64, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": ":char", "bit-size": 8, "bit-alignment": 8 } } }, { "tag": "field", "name": "flags", "bit-offset": 128, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":unsigned-int", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "min_filter", "bit-offset": 160, "bit-size": 32, "bit-alignment": 32, "type": { "tag": "gk_image_filter" } }, { "tag": "field", "name": "mag_filter", "bit-offset": 192, "bit-size": 32, "bit-alignment": 32, "type": { "tag": "gk_image_filter" } }, { "tag": "field", "name": "id", "bit-offset": 224, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_cmd_image_create", "location": "/usr/local/include/gk/gk.h:310:3", "type": { "tag": ":struct", "name": "gk_cmd_image_create", "id": 15 } },
{ "tag": "enum", "ns": 0, "name": "gk_align", "id": 0, "location": "/usr/local/include/gk/gk.h:313:14", "fields": [{ "tag": "field", "name": "GK_ALIGN_LEFT", "value": 1 }, { "tag": "field", "name": "GK_ALIGN_CENTER", "value": 2 }, { "tag": "field", "name": "GK_ALIGN_RIGHT", "value": 4 }, { "tag": "field", "name": "GK_ALIGN_TOP", "value": 8 }, { "tag": "field", "name": "GK_ALIGN_MIDDLE", "value": 16 }, { "tag": "field", "name": "GK_ALIGN_BOTTM", "value": 32 }, { "tag": "field", "name": "GK_ALIGN_BASELINE", "value": 64 }] },
{ "tag": "typedef", "ns": 0, "name": "gk_align", "location": "/usr/local/include/gk/gk.h:321:3", "type": { "tag": ":enum", "name": "gk_align", "id": 0 } },
{ "tag": "struct", "ns": 0, "name": "gk_cmd_font_style", "id": 0, "location": "/usr/local/include/gk/gk.h:323:16", "bit-size": 224, "bit-alignment": 32, "fields": [{ "tag": "field", "name": "parent", "bit-offset": 0, "bit-size": 64, "bit-alignment": 32, "type": { "tag": "gk_cmd" } }, { "tag": "field", "name": "size", "bit-offset": 64, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "blur", "bit-offset": 96, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "spacing", "bit-offset": 128, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "line_height", "bit-offset": 160, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "align", "bit-offset": 192, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_cmd_font_style", "location": "/usr/local/include/gk/gk.h:331:3", "type": { "tag": ":struct", "name": "gk_cmd_font_style", "id": 16 } },
{ "tag": "enum", "ns": 0, "name": "gk_font_face", "id": 0, "location": "/usr/local/include/gk/gk.h:333:14", "fields": [{ "tag": "field", "name": "GK_FONT_FACE_ID", "value": 0 }, { "tag": "field", "name": "GK_FONT_FACE_NAME", "value": 1 }] },
{ "tag": "typedef", "ns": 0, "name": "gk_font_face", "location": "/usr/local/include/gk/gk.h:336:3", "type": { "tag": ":enum", "name": "gk_font_face", "id": 0 } },
{ "tag": "struct", "ns": 0, "name": "gk_cmd_font_face", "id": 0, "location": "/usr/local/include/gk/gk.h:338:16", "bit-size": 192, "bit-alignment": 64, "fields": [{ "tag": "field", "name": "parent", "bit-offset": 0, "bit-size": 64, "bit-alignment": 32, "type": { "tag": "gk_cmd" } }, { "tag": "field", "name": "type", "bit-offset": 64, "bit-size": 32, "bit-alignment": 32, "type": { "tag": "gk_font_face" } }, { "tag": "field", "name": "face", "bit-offset": 128, "bit-size": 64, "bit-alignment": 64, "type": { "tag": "union", "ns": 0, "name": "", "id": 17, "location": "/usr/local/include/gk/gk.h:342:5", "bit-size": 64, "bit-alignment": 64, "fields": [{ "tag": "field", "name": "name", "bit-offset": 0, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": ":char", "bit-size": 8, "bit-alignment": 8 } } }, { "tag": "field", "name": "id", "bit-offset": 0, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } }] } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_cmd_font_face", "location": "/usr/local/include/gk/gk.h:346:3", "type": { "tag": ":struct", "name": "gk_cmd_font_face", "id": 18 } },
{ "tag": "struct", "ns": 0, "name": "gk_cmd_text", "id": 0, "location": "/usr/local/include/gk/gk.h:348:16", "bit-size": 320, "bit-alignment": 64, "fields": [{ "tag": "field", "name": "parent", "bit-offset": 0, "bit-size": 64, "bit-alignment": 32, "type": { "tag": "gk_cmd" } }, { "tag": "field", "name": "pos", "bit-offset": 64, "bit-size": 64, "bit-alignment": 32, "type": { "tag": "gk_vec2" } }, { "tag": "field", "name": "break_width", "bit-offset": 128, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "str", "bit-offset": 192, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": ":char", "bit-size": 8, "bit-alignment": 8 } } }, { "tag": "field", "name": "end", "bit-offset": 256, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": ":char", "bit-size": 8, "bit-alignment": 8 } } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_cmd_text", "location": "/usr/local/include/gk/gk.h:357:3", "type": { "tag": ":struct", "name": "gk_cmd_text", "id": 19 } },
{ "tag": "struct", "ns": 0, "name": "gk_cmd_tf", "id": 0, "location": "/usr/local/include/gk/gk.h:362:16", "bit-size": 192, "bit-alignment": 64, "fields": [{ "tag": "field", "name": "parent", "bit-offset": 0, "bit-size": 64, "bit-alignment": 32, "type": { "tag": "gk_cmd" } }, { "tag": "field", "name": "prior", "bit-offset": 64, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": "gk_mat4" } } }, { "tag": "field", "name": "out", "bit-offset": 128, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": "gk_mat4" } } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_cmd_tf", "location": "/usr/local/include/gk/gk.h:366:3", "type": { "tag": ":struct", "name": "gk_cmd_tf", "id": 20 } },
{ "tag": "enum", "ns": 0, "name": "gk_trs_flags", "id": 0, "location": "/usr/local/include/gk/gk.h:368:14", "fields": [{ "tag": "field", "name": "GK_TRS_ROTATE", "value": 1 }, { "tag": "field", "name": "GK_TRS_SCALE", "value": 2 }] },
{ "tag": "typedef", "ns": 0, "name": "gk_trs_flags", "location": "/usr/local/include/gk/gk.h:372:3", "type": { "tag": ":enum", "name": "gk_trs_flags", "id": 0 } },
{ "tag": "struct", "ns": 0, "name": "gk_cmd_tf_trs", "id": 0, "location": "/usr/local/include/gk/gk.h:374:16", "bit-size": 576, "bit-alignment": 64, "fields": [{ "tag": "field", "name": "parent", "bit-offset": 0, "bit-size": 192, "bit-alignment": 64, "type": { "tag": "gk_cmd_tf" } }, { "tag": "field", "name": "flags", "bit-offset": 192, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":unsigned-int", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "translate", "bit-offset": 224, "bit-size": 96, "bit-alignment": 32, "type": { "tag": "gk_vec3" } }, { "tag": "field", "name": "scale", "bit-offset": 320, "bit-size": 96, "bit-alignment": 32, "type": { "tag": "gk_vec3" } }, { "tag": "field", "name": "axis", "bit-offset": 416, "bit-size": 96, "bit-alignment": 32, "type": { "tag": "gk_vec3" } }, { "tag": "field", "name": "angle", "bit-offset": 512, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_cmd_tf_trs", "location": "/usr/local/include/gk/gk.h:383:3", "type": { "tag": ":struct", "name": "gk_cmd_tf_trs", "id": 21 } },
{ "tag": "struct", "ns": 0, "name": "gk_cmd_tf_ortho", "id": 0, "location": "/usr/local/include/gk/gk.h:385:16", "bit-size": 384, "bit-alignment": 64, "fields": [{ "tag": "field", "name": "parent", "bit-offset": 0, "bit-size": 192, "bit-alignment": 64, "type": { "tag": "gk_cmd_tf" } }, { "tag": "field", "name": "left", "bit-offset": 192, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "right", "bit-offset": 224, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "bottom", "bit-offset": 256, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "top", "bit-offset": 288, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "near", "bit-offset": 320, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "far", "bit-offset": 352, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_cmd_tf_ortho", "location": "/usr/local/include/gk/gk.h:391:3", "type": { "tag": ":struct", "name": "gk_cmd_tf_ortho", "id": 22 } },
{ "tag": "struct", "ns": 0, "name": "gk_list_gl", "id": 0, "location": "/usr/local/include/gk/gk.h:396:16", "bit-size": 192, "bit-alignment": 64, "fields": [{ "tag": "field", "name": "parent", "bit-offset": 0, "bit-size": 192, "bit-alignment": 64, "type": { "tag": "gk_list" } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_list_gl", "location": "/usr/local/include/gk/gk.h:398:3", "type": { "tag": ":struct", "name": "gk_list_gl", "id": 23 } },
{ "tag": "struct", "ns": 0, "name": "gk_quadvert", "id": 0, "location": "/usr/local/include/gk/gk.h:400:16", "bit-size": 192, "bit-alignment": 32, "fields": [{ "tag": "field", "name": "vertex", "bit-offset": 0, "bit-size": 128, "bit-alignment": 32, "type": { "tag": "gk_vec4" } }, { "tag": "field", "name": "uv", "bit-offset": 128, "bit-size": 64, "bit-alignment": 32, "type": { "tag": "gk_vec2" } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_quadvert", "location": "/usr/local/include/gk/gk.h:403:3", "type": { "tag": ":struct", "name": "gk_quadvert", "id": 24 } },
{ "tag": "struct", "ns": 0, "name": "gk_cmd_quad", "id": 0, "location": "/usr/local/include/gk/gk.h:405:16", "bit-size": 1376, "bit-alignment": 32, "fields": [{ "tag": "field", "name": "parent", "bit-offset": 0, "bit-size": 64, "bit-alignment": 32, "type": { "tag": "gk_cmd" } }, { "tag": "field", "name": "tex", "bit-offset": 64, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":int", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "tfm", "bit-offset": 96, "bit-size": 512, "bit-alignment": 32, "type": { "tag": "gk_mat4" } }, { "tag": "field", "name": "attr", "bit-offset": 608, "bit-size": 768, "bit-alignment": 32, "type": { "tag": ":array", "type": { "tag": "gk_quadvert" }, "size": 4 } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_cmd_quad", "location": "/usr/local/include/gk/gk.h:412:3", "type": { "tag": ":struct", "name": "gk_cmd_quad", "id": 25 } },
{ "tag": "struct", "ns": 0, "name": "gk_sprite", "id": 0, "location": "/usr/local/include/gk/gk.h:415:16", "bit-size": 992, "bit-alignment": 32, "fields": [{ "tag": "field", "name": "attr", "bit-offset": 0, "bit-size": 768, "bit-alignment": 32, "type": { "tag": ":array", "type": { "tag": "gk_quadvert" }, "size": 4 } }, { "tag": "field", "name": "size", "bit-offset": 768, "bit-size": 64, "bit-alignment": 32, "type": { "tag": "gk_vec2" } }, { "tag": "field", "name": "vsize", "bit-offset": 832, "bit-size": 64, "bit-alignment": 32, "type": { "tag": "gk_vec2" } }, { "tag": "field", "name": "anchor", "bit-offset": 896, "bit-size": 96, "bit-alignment": 32, "type": { "tag": "gk_vec3" } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_sprite", "location": "/usr/local/include/gk/gk.h:422:3", "type": { "tag": ":struct", "name": "gk_sprite", "id": 26 } },
{ "tag": "struct", "ns": 0, "name": "gk_spritesheet", "id": 0, "location": "/usr/local/include/gk/gk.h:424:16", "bit-size": 192, "bit-alignment": 64, "fields": [{ "tag": "field", "name": "tex", "bit-offset": 0, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":unsigned-int", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "nsprites", "bit-offset": 32, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":unsigned-int", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "sprites", "bit-offset": 64, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": "gk_sprite" } } }, { "tag": "field", "name": "names", "bit-offset": 128, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": ":pointer", "type": { "tag": ":char", "bit-size": 8, "bit-alignment": 8 } } } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_spritesheet", "location": "/usr/local/include/gk/gk.h:431:3", "type": { "tag": ":struct", "name": "gk_spritesheet", "id": 27 } },
{ "tag": "struct", "ns": 0, "name": "gk_cmd_quadsprite", "id": 0, "location": "/usr/local/include/gk/gk.h:433:16", "bit-size": 704, "bit-alignment": 64, "fields": [{ "tag": "field", "name": "parent", "bit-offset": 0, "bit-size": 64, "bit-alignment": 32, "type": { "tag": "gk_cmd" } }, { "tag": "field", "name": "tfm", "bit-offset": 64, "bit-size": 512, "bit-alignment": 32, "type": { "tag": "gk_mat4" } }, { "tag": "field", "name": "sheet", "bit-offset": 576, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": "gk_spritesheet" } } }, { "tag": "field", "name": "index", "bit-offset": 640, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":unsigned-int", "bit-size": 32, "bit-alignment": 32 } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_cmd_quadsprite", "location": "/usr/local/include/gk/gk.h:439:3", "type": { "tag": ":struct", "name": "gk_cmd_quadsprite", "id": 28 } },
{ "tag": "struct", "ns": 0, "name": "gk_cmd_b2d_world", "id": 0, "location": "/usr/local/include/gk/gk.h:445:16", "bit-size": 192, "bit-alignment": 64, "fields": [{ "tag": "field", "name": "parent", "bit-offset": 0, "bit-size": 64, "bit-alignment": 32, "type": { "tag": "gk_cmd" } }, { "tag": "field", "name": "timestep", "bit-offset": 64, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":float", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "data", "bit-offset": 128, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": ":void" } } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_cmd_b2d_world", "location": "/usr/local/include/gk/gk.h:452:3", "type": { "tag": ":struct", "name": "gk_cmd_b2d_world", "id": 29 } },
{ "tag": "enum", "ns": 0, "name": "gk_spritesheet_format", "id": 0, "location": "/usr/local/include/gk/gk.h:461:14", "fields": [{ "tag": "field", "name": "GK_SSF_TEXTUREPACKER_JSON", "value": 0 }] },
{ "tag": "typedef", "ns": 0, "name": "gk_spritesheet_format", "location": "/usr/local/include/gk/gk.h:463:3", "type": { "tag": ":enum", "name": "gk_spritesheet_format", "id": 0 } },
{ "tag": "enum", "ns": 0, "name": "gk_spritesheet_create_flags", "id": 0, "location": "/usr/local/include/gk/gk.h:465:14", "fields": [{ "tag": "field", "name": "GK_SCF_FLIP_X", "value": 1 }, { "tag": "field", "name": "GK_SCF_FLIP_Y", "value": 2 }, { "tag": "field", "name": "GK_SCF_MIN_NEAREST", "value": 4 }, { "tag": "field", "name": "GK_SCF_MAG_LINEAR", "value": 8 }] },
{ "tag": "typedef", "ns": 0, "name": "gk_spritesheet_create_flags", "location": "/usr/local/include/gk/gk.h:478:3", "type": { "tag": ":enum", "name": "gk_spritesheet_create_flags", "id": 0 } },
{ "tag": "struct", "ns": 0, "name": "gk_cmd_spritesheet_create", "id": 0, "location": "/usr/local/include/gk/gk.h:480:16", "bit-size": 384, "bit-alignment": 64, "fields": [{ "tag": "field", "name": "parent", "bit-offset": 0, "bit-size": 64, "bit-alignment": 32, "type": { "tag": "gk_cmd" } }, { "tag": "field", "name": "format", "bit-offset": 64, "bit-size": 32, "bit-alignment": 32, "type": { "tag": "gk_spritesheet_format" } }, { "tag": "field", "name": "path", "bit-offset": 128, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": ":char", "bit-size": 8, "bit-alignment": 8 } } }, { "tag": "field", "name": "filename", "bit-offset": 192, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": ":char", "bit-size": 8, "bit-alignment": 8 } } }, { "tag": "field", "name": "flags", "bit-offset": 256, "bit-size": 32, "bit-alignment": 32, "type": { "tag": ":unsigned-int", "bit-size": 32, "bit-alignment": 32 } }, { "tag": "field", "name": "sheet", "bit-offset": 320, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": "gk_spritesheet" } } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_cmd_spritesheet_create", "location": "/usr/local/include/gk/gk.h:492:3", "type": { "tag": ":struct", "name": "gk_cmd_spritesheet_create", "id": 30 } },
{ "tag": "struct", "ns": 0, "name": "gk_cmd_spritesheet_destroy", "id": 0, "location": "/usr/local/include/gk/gk.h:494:16", "bit-size": 128, "bit-alignment": 64, "fields": [{ "tag": "field", "name": "parent", "bit-offset": 0, "bit-size": 64, "bit-alignment": 32, "type": { "tag": "gk_cmd" } }, { "tag": "field", "name": "sheet", "bit-offset": 64, "bit-size": 64, "bit-alignment": 64, "type": { "tag": ":pointer", "type": { "tag": "gk_spritesheet" } } }] },
{ "tag": "typedef", "ns": 0, "name": "gk_cmd_spritesheet_destroy", "location": "/usr/local/include/gk/gk.h:497:3", "type": { "tag": ":struct", "name": "gk_cmd_spritesheet_destroy", "id": 31 } },
{ "tag": "const", "name": "GK_IMAGE_FLAGS_NANOVG_MASK", "ns": 0, "location": "/usr/local/include/gk/gk.h:260:9", "type": { "tag": ":long", "bit-size": 64, "bit-alignment": 64 }, "value": 31 },
{ "tag": "const", "name": "__GAMEKERNEL_CAPI_H__", "ns": 0, "location": "/usr/local/include/gk/gk.h:12:9", "type": { "tag": ":long", "bit-size": 64, "bit-alignment": 64 } }
]
