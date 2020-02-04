# -*- coding: utf8 -*-
import csv
import sys

stdout_encoding = sys.stdout.encoding
stdin_encoding = sys.stdin.encoding

def get_csv_data_in_dictionary_list(csv_path, delimiter=',', header=False, keys=[]):
    rows = []
    with open(str(csv_path), encoding='utf-8') as csvFile:
        reader = csv.reader(csvFile, delimiter=delimiter)
        for row in reader:
            rowDict = {}
            if header:
                header = False
                keys = row
            else:
                rowDict = {}
                for i in range(len(keys)):
                    rowDict[keys[i]] = row[i]
                rows.append(rowDict)
    return rows

def get_csv_data(csv_path, delimiter=',', header=False):
    rows = []
    with open(str(csv_path), encoding='utf-8') as csvFile:
        reader = csv.reader(csvFile, delimiter=delimiter)
        for row in reader:
            if header:
                header = False
            else:
                if len(row) == 1:
                    rows.append(row[0])
                else:
                    rows.append(row)
    return rows

def get_csv_data_in_tuples(csv_path, delimiter=',', header=False):
    rows = []
    with open(str(csv_path), encoding='utf-8') as csvFile:
        reader = csv.reader(csvFile, delimiter=delimiter)
        for row in reader:
            if header:
                header = False
            else:
                rows.append(tuple(row))
    return rows