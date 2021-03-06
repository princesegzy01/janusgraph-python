#!/usr/bin/env bash

# Copyright 2018 JanusGraph Python Authors
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


if [ -z "${1:-}" ]; then
  echo "Usage $(basename $0) [Env Name]"
  exit 1
else
  ENV_NAME="${1}"
fi

case $(uname -s) in
  MINGW*)     python_path="${ENV_NAME}"/Scripts/activate;;
  *)          python_path="${ENV_NAME}"/bin/activate
esac

source "${python_path}"

python -m pip install pybuilder > /dev/null
python -m pip install sphinx > /dev/null
python -m pip install docker > /dev/null

case $(uname -s) in
    MINGW*)     source deactivate;;
    *)          deactivate
esac
