#!/usr/bin/env bash

#Configuration
if [ "$1" = "MAPTester" ]
then
    export toolName="MAPTester"
    export timeout="3600"
    # MAP Configuration
    export ProjectPath="."
    export MAPClassPath="${ProjectPath}/map/MAPTest.jar"
    export MAPLibPath="${ProjectPath}/lib"
    export MAPOwnLibsPath="${ProjectPath}/ownLibs"
    export mainClass="MAPTester"
    #add Benchmark class path
    export BenchmarkRootPath="${ProjectPath}/benchmarks"
    #output file
    time=$(date +%s)
    export ResultRootPath="results/$time"
    mkdir -p "$ResultRootPath"
fi


runWithSeed(){

    rm -rf Instrument_Traces/
		
    currentBenchmarkPath=$1
    currentBenchmarkName=$2
    maxRuns=$3

    currentProjectResultDir="${ResultRootPath}/${currentBenchmarkName}"
    mkdir -p "${currentProjectResultDir}"

    currentRun=1
    while [ $currentRun -le $maxRuns ]
    do
        seed=$(( (currentRun-1)*100 ))

        timeout ${timeout} ./scripts/TestCut.sh ${currentBenchmarkPath} ${currentBenchmarkName} ${seed} ${currentRun} ${maxRuns} 10 ${currentProjectResultDir}

        currentRun=$((currentRun + 1))
    done
}

runWithSeed "$BenchmarkRootPath/BufferedInputStream" "BufferedInputStream" 10
runWithSeed "$BenchmarkRootPath/Day" "Day" 10
runWithSeed "$BenchmarkRootPath/Logger" "Logger" 10
runWithSeed "$BenchmarkRootPath/NumberAxis" "NumberAxis" 10
runWithSeed "$BenchmarkRootPath/PeriodAxis" "PeriodAxis" 10
runWithSeed "$BenchmarkRootPath/PerUserPoolDataSource" "PerUserPoolDataSource" 10
runWithSeed "$BenchmarkRootPath/SharedPoolDataSource" "SharedPoolDataSource" 10
runWithSeed "$BenchmarkRootPath/StringBuffer" "StringBuffer" 10
runWithSeed "$BenchmarkRootPath/SynchronizedMap" "SynchronizedMap" 10
runWithSeed "$BenchmarkRootPath/TimeSeries" "TimeSeries" 10
runWithSeed "$BenchmarkRootPath/XStream" "XStream" 10
runWithSeed "$BenchmarkRootPath/XYPlot" "XYPlot" 10
runWithSeed "$BenchmarkRootPath/XYSeries" "XYSeries" 10
runWithSeed "$BenchmarkRootPath/ConcurrentHashMap" "ConcurrentHashMap" 10
runWithSeed "$BenchmarkRootPath/AppenderAttachableImpl" "AppenderAttachableImpl" 10
runWithSeed "$BenchmarkRootPath/NullAppender" "NullAppender" 10
runWithSeed "$BenchmarkRootPath/FileAppender" "FileAppender" 10
runWithSeed "$BenchmarkRootPath/HashTable" "HashTable" 10
runWithSeed "$BenchmarkRootPath/Vector142" "Vector" 10
runWithSeed "$BenchmarkRootPath/Vector117" "Vector" 10
