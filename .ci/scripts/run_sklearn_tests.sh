#!/bin/bash
#===============================================================================
# Copyright 2023 Intel Corporation
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#===============================================================================

# Args:
# 1 - device name (optional)

ci_dir=$( dirname $( dirname "${BASH_SOURCE[0]}" ) )
cd $ci_dir

# selected tests might be set externally
# ('all' - special value to run all tests)
export SELECTED_TESTS=${SELECTED_TESTS:-$(python scripts/select_sklearn_tests.py)}
export DESELECTED_TESTS=$(python ../.circleci/deselect_tests.py ../deselected_tests.yaml)

python scripts/run_sklearn_tests.py -d ${1:-none}
exit $?
