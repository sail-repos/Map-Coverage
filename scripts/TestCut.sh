#!/usr/bin/env bash

CurrentBenchmarkPath=$1
CurrentBenchmarkName=$2
seed=$3
currentRun=$4
maxRuns=$5
maxSuffixGenTries=$6
currentResutlDir=$7

BenchmarkJarPath=`find ${CurrentBenchmarkPath}/jar -name "*.jar" | xargs | sed -e "s/ /:/g"`
BenchmarkLibPath=`find ${CurrentBenchmarkPath}/lib -name "*.jar" | xargs | sed -e "s/ /:/g"`

ClassPaths="${MAPClassPath}:${MAPLibPath}/*:${MAPOwnLibsPath}/*:\
            ${BenchmarkLibPath}:${BenchmarkJarPath}"
ClassPaths=${ClassPaths// }

cut=`cat ${CurrentBenchmarkPath}/cut.txt`
envTypes="${CurrentBenchmarkPath}/env_types.txt"

resultFile="${currentResutlDir}/${cut}_seed${seed}_tries${maxSuffixGenTries}.result"
logFile="${currentResutlDir}/${cut}_seed${seed}_tries${maxSuffixGenTries}.out"
callClinit="false"

echo "Testing ${cut} until a bug is found ("${currentRun}"/"${maxRuns}")"

java -ea -javaagent:${MAPLibPath}/iagent.jar \
     -cp ${ClassPaths} ${mainClass} ${cut} ${envTypes} ${seed} ${maxSuffixGenTries} ${resultFile} ${callClinit} > ${logFile} 2>&1

wc=`wc -l ${resultFile}`
lines=`echo ${wc} | cut -d" " -f1`

if [ "$lines" -gt "2" ]
then
  echo "Found BUG! Stopping to test."
  exit 0
else
  echo "         ... nothing"
fi
