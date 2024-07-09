# Ruby on Rails Assesment
Thank you for taking the assessment. We will have you work with a sample Pet Adoption Service. We'll outline below the current features, and ask you to implement some new information on our pets. **The intent here is to get as far as you can within 2-4 hours. Please don't feel like you need to spend anymore time on it.**

**Notes**
- You may choose to add or change any libraries you want, as well as any decision required.
- For tests you can choose MiniTest or Rspec and create tests as you develop the new features. We'll also ask you to use an external API to use one of our pets and get more information.
- We will run the tests locally on our machines. Please provide any documentation in the README you think might be needed for us to be able to follow the steps to do that.

## Steps
1. Create your own github repository for the assessment. The access can be either public or private. In case it is private, we will send you the email list so you can allow the access.
2. Unzip the assessment we sent, and upload it to the main branch.
3. Create and checkout a feature branch for you to submit changes. **Do not commit directly on the main branch.**
4. Navigate to the project directory and review it.
5. Run migrations and seeds.
6. Read the instructions below and develop the requirements.
7. After you commit and push your changes, create a pull request and send us the link for review.

## Current State
The functionalities and tests below already exist on the project:

##### Features
1. We can create a pet with the fields 'name', 'kind' and 'breed'.
2. We can list, view, edit and update the pet.

##### Tests
1. Controller tests
2. System tests

## Requirements
We do not need any frontend changes, just make sure the new features are correctly working when using the Rails Console.

##### New Features
1. Add the ability to give the pet a weight.
2. Add a model for owners with any basic information you choose.
3. Make sure an owner can have many pets.
4. Integrate with the [DogAPI](https://dogapi.dog/) to retrieve the pet breed information, using the [GET breeds endpoint](https://dogapi.dog/docs/api-v2).
5. Add ability for the Owner to pick a pet and get breed information about that pet.

##### Tests
1. Create tests for the models.
2. Create tests to cover the new features added to the code.
3. Feel free to add any extra/missing test or refactor if you believe it makes sense.

##### Documentation
1. Update the documentation and add all the required steps in order to successfuly run and test your application.
2. You may add any extra section in case you feel it is needed.
3. In case you encounter any assumption or decision to be made, you can choose yourself the best option, and add an extra section explaining about your decisions.
4. In case you are not able to complete the requirements or think there is something to be done afterwards, you may add an extra section with the explanation.

### Evaluation Criteria
1.  **Code Quality:** Maintainable, well-structured code following Ruby and Rails best practices.
2.  **Functionality:** The features you choose to finish should be functional.
3.  **Testing:** Extensive test coverage ensures the application's reliability and stability.
4.  **Documentation:** Clear and concise documentation covering setup instructions, usage guidelines, and any notable design decisions.
5.  **Adherence to Best Practices:** Consistent use of Rails conventions, adherence to RESTful principles, and implementation of secure coding practices.


### Submitting your assessment
1. Push your changes to the feature branch you created in the setup.
2. Create a pull request and share the link with us.
3. After you submit your solution, we'll review it and talk it over with you.
