/**
 * @license Copyright 2019 Google Inc. All Rights Reserved.
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
 */
'use strict';

module.exports = {
  ci: {
    collect: {
      url: 'testlink',
      numberOfRuns: 1,
          },
    assert: {
      assertions: {
        'categories:performance': ['warn', {minScore: 0.3}],
        'categories:accessibility': ['error', {minScore: 0.3}]
            }
          },

    upload: {
      target: 'lhci',
      serverBaseUrl: 'https://voprun3-hs2ja3xnsa-ue.a.run.app',
      token: '032be305-85b3-4c3a-bcc8-c1c29e78ed11', // could also use LHCI_TOKEN variable instead
    },
  },
};
