var page = require('webpage').create();
var system = require('system');

/**
* Use this function for logging:
*
*/
function log(args) {
    args = [].slice.call(arguments);
    var ret = args.reduce(function(acc, val, i) {
        return acc.concat(typeof val === 'object' ? JSON.stringify(val) : val);
    }, []);
    console.log.apply(console, ret);
}

page.onConsoleMessage = function(msg) {
    console.log(msg);
};

page.onAlert = function(msg) {
    console.log(msg);
};

page.open(system.args[1], function(status) {
    if (status !== 'success') {
        console.log('Unable to access network');
    } else {
        page.evaluate(function(args) {

        });
    }
    phantom.exit();
});