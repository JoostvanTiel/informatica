#-------------------------------------------------------------------------------
# Name:        5ha informatica leerlingen
# Purpose:
#
# Author:      JoostvanTiel
#
# Created:     07-11-2025
# Copyright:   (c) JoostvanTiel 2025
# Licence:     <your licence>
#-------------------------------------------------------------------------------

leerlingen = [
        "aeneak",
        "daiyeng",
        "fillink",
        "jorisp",
        "kianw",
        "matildag",
        "randh",
        "rubenc",
        "samh",
        "saras",
        "serjikb",
        "silvijnw",
        "sverreh"
        ]


queries = ""
for leerling in leerlingen:
    table = "nimmastream_"+leerling+".beoordelingen"
    query = "DELETE FROM "+table+" WHERE profiel_id IN (155, 59, 412, 203, 322, 247, 93, 136, 366, 322);\n"
    queries += query

print(queries)