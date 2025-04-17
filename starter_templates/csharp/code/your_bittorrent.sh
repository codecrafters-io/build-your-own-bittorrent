#!/bin/sh
#
exec dotnet run --project . --configuration Release -- "$@"