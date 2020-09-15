#!/bin/bash

echo "Running $0 in $PWD"
set -ev
lightd --chain-id "Binance-Chain-Ganges" --laddr tcp://localhost:26657 --node tcp://data-seed-pre-0-s1.binance.org:80
