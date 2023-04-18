#[contract]
mod ValidateCairo101 {
    ////////////////////////////////
    // Core Library imports
    // These are syscalls and functionalities that allow you to write Starknet contracts
    ////////////////////////////////
    use starknet::get_caller_address;
    use starknet::ContractAddress;
    
    ////////////////////////////////
    // Internal imports
    // These functions become part of the set of functions of the contract
    ////////////////////////////////
    use starknet_cairo_101::ex14::IAllInOneContract;

    impl ValidateCairo101 of IAllInOneContract {
        fn validate_various_exercises() {
            // call ex1 ClaimPoints() function in order to claim the points
            // for this exercise
            //ex1();
        }
    }

    #[external]
    fn validate_various_exercises() {
        ValidateCairo101::validate_various_exercises();
    }
}