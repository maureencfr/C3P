# Mutation Testing Practice

## Starting with Code Coverage

DrTest show me that we have 79.59% coverage test with 10 uncovered methods and 6 methods covered partially.
To increase the coverage, we can write tests for the uncovered methods and analyse the tests of the covered partially ones in order to rewrite them better. For example in Java, Jacoco show us what parts of the method are covered or not.

Code coverage can be seen as a good proxy for code and test quality because if your code is greatly covered then it have less chances to crash. However code coverage just show that code is tested..not tested the right way, and you can try to increase the code coverage with useless tests : copy-paste, tests without added value, etc. So code coverage is a good metrics but you must not check only this.

## Mutating UUID

I have a score of 46, so now 46% of mutants are killed.
I think the mutation score can be seen as more precise because it's an indicator of quality of tests, code coverage only indicates how much code are tested. But you can also have equivalent mutations that it's not a big deal if they survive, so it affects the precision of this metric. Also you Don't know if the mutants survived because there is no test or because the test is not good or because it's dead code.
To conclude you really must Watch at the both metrics to have a real idea of your code and test quality.


*Before we had not covered method (actually the tool measures it at a finer granularity but it is not shown...), and now we have surviving mutants. What is the relationship between them? Why they differ in number? Are there implementation differences in the analyses? Or some important differences between the approaches?*

*Related to the question before: can you think about an example of code that is covered but fails mutation testing?*

In the number of surviving mutants there are which come from not covered methods. The implementation is different because surviving mutants can also come from dead code, equivalent semantics and not *fully* covered method.


The mutation score is now 71% and the method with the most survivants is readFrom.
Link to the tests I Added : https://github.com/maureencfr/C3P/tree/main/src/Network-Tests

With UUIDGeneratorTests Added,the mutation score is 75%.

For equivalent I find this one :

    printString
	"Return a String with my official representation, 32 lowercase hexadecimal digits, displayed in five groups separated by hyphens, in the form 8-4-4-4-12 for a total of 36 characters (32 alphanumeric characters and four hyphens)"

	^ String
		  new: 36
		  streamContents: [ :stringStream | self printOn: stringStream ]*

which become this : 

    printString
	"Return a String with my official representation, 32 lowercase hexadecimal digits, displayed in five groups separated by hyphens, in the form 8-4-4-4-12 for a total of 36 characters (32 alphanumeric characters and four hyphens)"

	^ WideString
		  new: 36
		  streamContents: [ :stringStream | self printOn: stringStream ]*

In this method replace String by one of its subclasses doesn't have to change anything I guess


## Improving Mutation Analysis Runtime

To improve mutation performance, we can try to mix the two methods exposed in the subject. For each mutation, you run only the tests covering the mutated method and stop on the first fail. By the way the test killing the mutant are great chances to be the test that checks the part of the method where the mutant is (I don't know if my explication is clear), so we don't need to run the tests that covered the others parts of the method.






