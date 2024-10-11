#!/bin/bash

gawk -F, '
function ltrim(s) { sub(/^[ \t\r\n]+/, "", s); return s }
function rtrim(s) { sub(/[ \t\r\n]+$/, "", s); return s }
function trim(s) { return rtrim(ltrim(s)); }

BEGIN { OFS = "\t"; total_age = 0; count = 0 }

{
    if ($3 == 2 && trim($13) == "S") {
        # Replace gender labels
        if (tolower(trim($6)) == "male") {
            gender = "M"
        } else if (tolower(trim($6)) == "female") {
            gender = "F"
        } else {
            gender = trim($6) # In case gender label is different or missing
        }

        # Print relevant fields with modified gender label
        print $1, $3, gender, $13

        # Calculate total age and count for averaging
        age = trim($7)
        if (age != "") {
            total_age += age
            count++
        }
    }
}


END {
    if (count > 0) {
        avg_age = total_age / count
        print "Average Age:", avg_age
    } else {
        print "No matching passengers found."
    }
}
' titanic.csv