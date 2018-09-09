module demorgan
(
  input  A,          // inputs
  input  B,
  output nA,         // A complement, ~A
  output nB,         // B complement, ~B
  output nAandnB,     // (~A)*(~B)
  output AandB,       // A*B
  output nAandB,       // ~(A*B)
  output nAornB,       // ~A + ~B
  output AorB,         // A+B
  output nAorB        // ~(A+B)
);

  // (~A)*(~B)
  wire nA;
  wire nB;
  not Ainv(nA, A);  	// Top inverter is named Ainv, takes signal A as input and produces signal nA
  not Binv(nB, B);    // invert B
  and andgate(nAandnB, nA, nB); 	// AND gate produces nAandnB from nA and nB

  // ~(A*B)
  wire AandB;
  and andgateAB(AandB, A, B);  // AND A and B together
  not AandBinv(nAandB, AandB);  // take the inverse of A and B

  // ~A + ~B
  wire nAornB;
  or orgate(nAornB, nA, nB);  // OR not A with not B

  // ~(A+B)
  wire AorB;
  or orgateAB(AorB, A, B);  // OR with A or B
  not AorBinv(nAorB, AorB);  // take the inverse of A or B
endmodule
