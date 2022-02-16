'use strict'

function format_value(v, r, n)
{
    if (r == 10) {
	return v.toString(); 
    }
    v &= (1 << n) - 1; 
    return v.toString(r).padStart((r == 16 ? (n >> 2) : n), '0');
}

function radix_to_str (r)
{
	if (r == 2) 
		return "binary";
	if (r == 10)
		return "decimal";
	if (r == 16)
		return "hexadecimal";
	return "radix " + r;
}

const testView = Vue.createApp ({
    data () {
        return {
            config_mode: 0,

            nbits: '8',
            is_signed: true,
            q_radix: 2,	// Default: from 2's complement numbers to decimal numbers 
            a_radix: 10,

            nbits_options: [
              { text: '4 bits', value: 4 },
              { text: '8 bits', value: 8 },
              { text: '12 bits', value: 12 },
              { text: '16 bits', value: 16 }
            ],
            
            radix_options: [
              { text: 'Binary', index: 0, value: 2},
              { text: 'Decimal', index: 1, value: 10},
              { text: 'Hexadecimal', index: 2, value: 16}
            ],

            correct: 0,
            wrong: 0,

            config_str: '', 
            question: '',
            numTries: 0,
            value: 0,
            valueQ: '',
            valueA: '',

            err_message: '',

            inString: '',
            answerMessage: 'Enter your answer'
        }
    },
    methods: {
        showConfig: function () {
	    this.config_mode = 1;
	},

        newTest: function () {
            // console.log(this.is_signed);
	    if (this.q_radix == this.a_radix) {
		    if (this.a_radix == 10) 
			    this.a_radix = 2; 
		    else
			    this.a_radix = 10; 
	    }
	    this.config_str = "Assume " + this.nbits + " bits " + 
			(this.is_signed ? "two's complement" : "unsigned") +
			" numbers.\n";
		
	    this.config_str += "Convert the following number from " +
			radix_to_str(this.q_radix) + " to " +
			radix_to_str(this.a_radix) + ".\n";
	    this.correct = this.wrong = 0;
	    this.newQuestion();
	    this.config_mode = 0;
        },

	newQuestion: function () {
	    var ub = 1 << this.nbits;  // upper bound
	    var v = Math.floor(Math.random() * ub);
	    if (this.is_signed && v & (ub >> 1)) 
		v -= ub;
	    this.value = v;
	    this.valueA = format_value(v, this.a_radix, this.nbits);
	    this.valueQ = format_value(v, this.q_radix, this.nbits);
	    console.log(v);
	    console.log(this.valueA);
	    console.log(this.valueQ);
	    this.inString = '';
	    this.numTries = 0;
	},
	
        checkAnswer: function () {
            // console.log(this.nbits);
	    var answer = this.inString.toLowerCase().replace(/\s+/g,"");
	    if (answer == this.valueA) {
		if (! this.numTries) 
		    this.correct ++;
		this.newQuestion();
		return;
	    }
	    if (! this.numTries) {
		this.wrong ++;
	    	this.numTries ++;
	    }
        },

	skipQuestion: function () {
	    if (! this.numTries)
		this.wrong ++;
	    this.newQuestion();
	},
	
	showAnswer: function () {
	    if (! this.numTries) {
		this.wrong ++;
		this.numTries ++;
	    }
	    this.inString = this.valueA;
	}
    }
} ).mount('#mainDiv');

testView.newTest();

