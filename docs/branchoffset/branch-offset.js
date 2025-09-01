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
            message: '' 
        }
    },
    methods: {
	
        checkAnswer: function () {
            var [funct7, rd] = generateAnswers(this.branchOffset);

            if (funct7 != this.funct7Input) {
                this.message = "funct7 is not correct."; 
                return;
            }

            if (rd != this.rdInput) {
                this.message = "rd is not correct.\n"; 
                return;
            }

            this.message = "Correct";
            return;
        },

        checkBranchOffset: function () {
	    var t = this.branchOffsetInput.toLowerCase().replace(/\s+/g,"");
            let branchOffset = +t;
            if (isNaN(branchOffset)) {
                this.branchOffsetStr = "Branch offset must be an integer.";
                return;
            }
            if (branchOffset % 2 != 0) {
                this.branchOffsetStr = "Branch offset must be even.";
                return;
            }
            if (t.startsWith("0x")) {
                if (branchOffset > 0x1FFF) {
                    this.branchOffsetStr = "Branch offset is too large."; 
                    return;
                }
                if (branchOffset > 0xFFF) {
                    branchOffset -= 0x2000; 
                }
            } else {
                if (branchOffset > 4094) {
                    this.branchOffsetStr = "Branch offset is too large."; 
                    return;
                }

                if (branchOffset < -4096) {
                    this.branchOffsetStr = "Branch offset is too small."; 
                    return;
                }
            }
            let bstr = formatValue(branchOffset, 2, 13);
            // 0 1 2 3 4  5 6 7 8  9 10 11 12
            this.branchOffsetStr = bstr.substr(0,1) + " " +  
                bstr.substr(1,4) + " " + 
                bstr.substr(5, 4) + " " + bstr.substr(9);

            this.branchOffset = branchOffset
            this.message = "";
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

