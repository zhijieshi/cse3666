'use strict'

// v.toString() gives the decimal representation
function toBitString(v, n)
{
    if (n > 32) {
        n = 32;
    }

    let s;

    if (v >= 0) {
        s = v.toString(2).padStart(n, '0');
    } else {
        s = (v >>> 0).toString(2).substr(-n);
    }

    return s;
}

// return imm[20 | 10:1 | 11 | 19:12]
// bstr is the 32 bits representation of offset 
function offset2mcode(bstr)
{
    //       imm[20 | 10:1 | 11 | 19:12]
    // index:    0    10     9    1
    // len:      1    10     1    8
    var rstr = bstr.substr(0, 1) + bstr.substr(10,10)
             + bstr.substr(9, 1) + bstr.substr(1, 8);

    return rstr;
}

function formatOffset20(bstr)
{
    // Place offset[20:1] into groups
    //     x_xxxx_xxxx_xxxx_xxxx_xxx
    var rstr = bstr.substr(0, 1) + "_" + bstr.substr(1,4) + "_"
             + bstr.substr(5, 4) + "_" + bstr.substr(9, 4) + "_"
             + bstr.substr(13, 4) + "_" + bstr.substr(17, 3);
    return rstr;
}

function formatMCode(bstr)
{
    // Place the highest 20 bits in the machine code in groups 
    //       imm[20 | 10:1 | 11 | 19:12]
    var rstr = bstr.substr(0, 1) + "_" + bstr.substr(1,10) + "_"
             + bstr.substr(11, 1) + "_" + bstr.substr(12, 8);
    return rstr;
}

const app = Vue.createApp ({
    data () {
        return {
            offsetInput: "-20",
            offsetDisplay: "",
            offsetSignDisplay: "",
            offset_message: '',
            expected_mcode: '',
            mcodeInput: '',
            mcodeStr: '',
            mcodeDisplay: '',
            showHelp: false,
            message: ''
        }
    },
    methods: {
	
        checkAnswer: function () {
            if (this.mcodeStr == "") {
                this.message = "The machine code was not entered properly."; 
                return;
            } 

            if (this.expected_mcode == "") {
                this.message = "The offset was not entered properly."; 
                return;
            }

            if (this.mcodeStr != this.expected_mcode) {
                this.message = "The offset and the instruction do not match."; 
                return;
            }

            this.message = "Correct";
            return;
        },

        checkOffset: function () {
	    var t = this.offsetInput.toLowerCase().replace(/(\s|_)/g,"");
            let offset = +t;
            this.message = "";
            this.offset_message = "";
            this.expected_mcode = "";
            this.offsetSignDisplay = "X".repeat(11);
            this.offsetDisplay = "X".repeat(20);

            if (isNaN(offset)) {
                this.offset_message = "Offset must be an even integer.";
                return;
            }
            if (!Number.isSafeInteger(offset)) {
                this.offset_message = "The offset is out of range."; 
                return;
            }
            if (offset % 2 != 0) {
                this.offset_message = "Offset must be even.";
                return;
            }

            let bstr = toBitString(offset, 32);
            this.offsetSignDisplay = bstr.substr(0, 11);
            this.offsetDisplay = formatOffset20(bstr.substr(11, 20));
            if (! t.startsWith("0x") && ! t.startsWith("0b")) {
                // decimal input
                if (offset < -0x100000) {
                    this.offset_message = "The offset is too small."; 
                    return;
                }
                if (offset > 0x0FFFFF) {
                    this.offset_message = "The offset is too large."; 
                    return;
                }
            }
            else {
                if (offset > 0x1FFFFF) {
                    this.offset_message = "The offset is too large."; 
                    return;
                }
                if (offset > 0x0FFFFF) {
                    this.offsetSignDisplay = "1".repeat(11);
                }
            }
            this.expected_mcode = offset2mcode(bstr.substr(-21)); 
            console.log("expected bits in the machine code ="+this.expected_mcode);
        }, 

        checkMCode: function () {
	    var t = this.mcodeInput.toLowerCase().replace(/(\s|_)/g,"");
            console.log(t);
            let v = +t;
            this.message = "";
            this.mcode_message = "";
            this.mcodeDisplay = "X".repeat(20);
            this.mcodeStr = "";

            if (isNaN(v)) {
                this.mcode_message = "Enter an integer in dec/bin/hex.";
                return;
            }
            if (!Number.isSafeInteger(v)) {
                this.offset_message = "The number is out of range."; 
                return;
            }

            this.mcodeStr = toBitString(v, 20);
            this.mcodeDisplay = formatMCode(this.mcodeStr);

            if (v < 0) {
                this.mcode_message = "Enter a non-negative number."; 
                return;
            }
            if (v > 0xFFFFF) {
                this.mcode_message = "The number is too large."; 
                return;
            }
        },
        
        toggleHelp: function () {
            this.showHelp = ! this.showHelp;
        },

        setOffset: function (offset, mcode) {
            this.offsetInput = offset;
            this.checkOffset();
            this.mcodeInput = mcode;
            this.checkMCode();
        }
    }
}).mount('#mainDiv');

app.setOffset("0x1A0F0A", "0b1 1110000101 1 10100000");

