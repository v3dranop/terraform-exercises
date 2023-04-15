module.exports = {
  ci: {
    collect: {
      url: ['https://sf.feature.dev.shop.hessnatur.tech/de/outdoor'],
      numberOfRuns: 1,
      settings: {
        chromeFlags: '--no-sandbox',
        throttling: {
          // Network throttling settings
          rttMs: 150, // Round-trip time in milliseconds
          throughputKbps: 1638.4, // Network throughput in kilobits per second
          cpuSlowdownMultiplier: 1 // CPU slowdown multiplier
        },
      },
    },
    assert: {
      assertions: {
        'categories:performance': [
          'error',
          { minScore: 0.3, aggregationMethod: 'median-run' },
        ],
        'categories:accessibility': [
          'error',
          { minScore: 0.3, aggregationMethod: 'pessimistic' },
        ],
        'categories:best-practices': [
          'error',
          { minScore: 0.3, aggregationMethod: 'pessimistic' },
        ],
        'categories:seo': [
          'error',
          { minScore: 0.3, aggregationMethod: 'pessimistic' },
        ],
      },
    },
    upload: {
      target: 'lhci',
      serverBaseUrl: 'https://hess-webshop-dev-760c-lhci-server-iozx2yblkq-ey.a.run.app', // lhci server url
      token: '43c78ec2-1cf8-48a8-87c4-f92b910d2685', //lhci server build admin token
      ignoreDuplicateBuildFailure: true,
      basicAuth: {
        username: "lhci_server_user",
        password: "BNsxdcOxp2wD6f5x"
      }
    },
  },
};
