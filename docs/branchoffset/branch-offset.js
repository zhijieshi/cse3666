'use strict'

function formatValue(v, r, n)
{
    if (r == 10) {
	return v.toString(); 
    }
    v &= (1 << n) - 1; 
    return v.toString(r).padStart((r == 16 ? (n >> 2) : n), '0');
}

// return [funct7, rd]
function generateAnswers(offset)
{
    var bstr;

    bstr = formatValue(offset, 2, 13);

    // 0 [1] 2 3 4 5 6 7    8 9 10 11 12
    var rd = bstr.substr(8, 4) + bstr.substr(1,1);
    var funct7 = bstr.substr(0,1) + bstr.substr(2, 6);

    return [funct7, rd]
}

const testView = Vue.createApp ({
    data () {
        return {
            branchOffsetInput: "-20",
            branchOffset: -20,
            branchOffsetStr: "",
            funct7Input: '0000000',
            rdInput: '00000',
            showHelp: false,
            offset_message: '',
            message: '' 
        }
    },
    methods: {
	
        checkAnswer: function () {
            if (this.branchOffset == -1) {
                this.message = "Branch offset is not valid";
                return;
            }

            var [funct7, rd] = generateAnswers(this.branchOffset);

            if (funct7 != this.funct7Input) {
                this.message = "funct7 does not match the branch offset."; 
                return;
            }

            if (rd != this.rdInput) {
                this.message = "rd does not match the branch offset."; return;
            }

            this.message = "Correct";
            return;
        },

        checkBranchOffset: function () {
	    var t = this.branchOffsetInput.toLowerCase().replace(/\s+/g,"");
            let branchOffset = +t;
            this.message = "";

            if (isNaN(branchOffset)) {
                this.branchOffsetStr = "Not a number";
                this.branchOffset = -1; 
                this.offset_message = "Branch Offset must be an integer.";
                return;
            }
            if (branchOffset % 2 != 0) {
                this.branchOffsetStr = "Not even";
                this.branchOffset = -1; 
                this.offset_message = "Branch Offset must be even.";
                return;
            }
            if (t.startsWith("0x")) {
                if (t.length > 6) {
                    this.branchOffsetStr = "Too large";
                    this.branchOffset = -1; 
                    this.offset_message = "Enter up to 4 hexadecimal digits after 0x.";
                    return;
                }
                if (t.length == 6) {
                    // negative branch offset
                    if (t[2] == "1") {
                        branchOffset -= 0x2000;
                    } else if (t[2] == "f") {
                        branchOffset -= 0x10000;
                    }
                }
                if (branchOffset > 0xFFF) {
                    this.branchOffsetStr = "Too large";
                    this.branchOffset = -1; 
                    this.offset_message = "A positive branch offset cannot be largr than 0xFFE."; 
                    return;
                }
            } else {
                if (branchOffset > 4094) {
                    this.branchOffsetStr = "Too large";
                    this.branchOffset = -1; 
                    this.offset_message = "Branch offset cannot be largr than 4094."; 
                    return;
                }

                if (branchOffset < -4096) {
                    this.branchOffsetStr = "Too small";
                    this.branchOffset = -1; 
                    this.offset_message = "Branch offset cannot be smaller than -4096."; 
                    return;
                }
            }
            this.offset_message = '';

            let bstr = formatValue(branchOffset, 2, 13);
            // 0 1 2 3 4  5 6 7 8  9 10 11 12
            this.branchOffsetStr = bstr.substr(0,1) + " " +  
                bstr.substr(1,4) + " " + 
                bstr.substr(5, 4) + " " + bstr.substr(9);

            this.branchOffset = branchOffset
        }, 

        toggleHelp: function () {
            this.showHelp = ! this.showHelp;
        },

        setBranchOffset: function (offset) {
            this.branchOffsetInput = offset;
            this.checkBranchOffset();
        }
    }
}).mount('#mainDiv');

testView.setBranchOffset("0x1D5A");

