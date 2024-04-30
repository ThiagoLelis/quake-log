# Quakle Game Stats Parser

## Overview
This is a Ruby application for parsing game logs and generating statistics about the games.

## Requirements
- Docker

## Usage
1. Clone this repository to your local machine:

```
git clone https://github.com/ThiagoLelis/quake-log.git
```

2. Navigate to the project directory:

```
cd quake-log
```

3. Install dependencies using Bundler:

```
make build
```

4. Prepare your game log file. The log file should contain game data in the following format or use the standard on resources/qgames.log:

```
 0:00 InitGame: \sv_floodProtect\1\sv_maxPing\0\sv_minPing
 15:00 Exit: Timelimit hit.
 20:34 ClientConnect: 2
 20:34 ClientUserinfoChanged: 2 n\Isgalamido\t\0\model\xian/default\hmodel\xian/
 20:37 ClientUserinfoChanged: 2 n\Isgalamido\t\0\model\uriel/zael\hmodel\uriel/
 20:37 ClientBegin: 2
 20:37 ShutdownGame:
```

5. Run the game parser script with the path to your log file:

```
make run LOG_FILE=resources/qgames.log
```

By default, the script will generate a file named `game_stats.json` in the resources directory. If you want to specify a different output file, you can provide the file path as a second argument:

```
make run LOG_FILE=resources/qgames.log OUTPUT_FILE=resources/output_file.json
```

6. Once the script finishes running, you can find the generated game statistics in the output file specified or show in the terminal the generated file.


## Tests

1. To run tests run the following command:

```
make test
```
