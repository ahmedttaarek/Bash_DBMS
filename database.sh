#!/bin/bash


create_database() {
    dbname=$(zenity --entry --title="Create Database" --text="Enter database name:")
    if [ -n "$dbname" ]; then
        mkdir "$dbname"
        zenity --info --title="Database Created" --text="Database $dbname created."
    else
        zenity --error --title="Error" --text="No database name provided."
    fi
}

list_databases() {
    databases=$(ls -d */)
    if [ -n "$databases" ]; then
        zenity --list --title="Available Databases" --column="Databases" $databases
    else
        zenity --info --title="No Databases" --text="No databases found."
    fi
}


connect_database() {
    dbname=$(zenity --entry --title="Connect to Database" --text="Enter database name to connect:")
    if [ -d "$dbname" ]; then
        cd "$dbname"
        zenity --info --title="Connected" --text="Connected to $dbname."
        database_menu
    else
        zenity --error --title="Error" --text="Database $dbname does not exist."
    fi
}

drop_database() {
    dbname=$(zenity --entry --title="Drop Database" --text="Enter database name to drop:")
    if [ -d "$dbname" ]; then
        rm -r "$dbname"
        zenity --info --title="Database Dropped" --text="Database $dbname dropped."
    else
        zenity --error --title="Error" --text="Database $dbname does not exist."
    fi
}


create_table() {
    tablename=$(zenity --entry --title="Create Table" --text="Enter table name:")
    columns=$(zenity --entry --title="Create Table" --text="Enter columns (name:type, ...):")
    pk=$(zenity --entry --title="Create Table" --text="Enter primary key column:")
    if [ -n "$tablename" ] && [ -n "$columns" ] && [ -n "$pk" ]; then
        echo "$columns,primary_key:$pk" > "$tablename"
        zenity --info --title="Table Created" --text="Table $tablename created."
    else
        zenity --error --title="Error" --text="Incomplete table details provided."
    fi
}

list_tables() {
    tables=$(ls)
    if [ -n "$tables" ]; then
        zenity --list --title="Available Tables" --column="Tables" $tables
    else
        zenity --info --title="No Tables" --text="No tables found."
    fi
}

