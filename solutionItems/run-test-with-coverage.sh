#!/bin/bash -e

dotnet test --results-directory $(pwd)/tmp/unit-test-results --logger "trx;LogFileName=unit_test_results.xml" /p:CollectCoverage=true /p:CoverletOutputFormat=\"cobertura,opencover,json\" /p:CoverletOutput=$(pwd)/tmp/unit-test-results/coverage/ /p:Exclude="[xunit.*]*%2c[StackExchange.*]*" ../tests/CleanArchitecture.Test.Unit

reportgenerator "-reports:$(pwd)/tmp/unit-test-results/coverage/coverage.opencover.xml" "-targetdir:$(pwd)/tmp/coverage/reports" "-reporttypes:HtmlInline_AzurePipelines;Cobertura;Badges;Latex;" -verbosity:Info

open $(pwd)/tmp/coverage/reports/index.htm