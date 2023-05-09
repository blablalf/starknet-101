// Libraries
use starknet::ContractAddress;

////////////////////////////////
// ABI imports
// These are the interfaces of the contracts that you will interact with.
////////////////////////////////
#[abi]
trait Iex01 {
    fn claim_points();
}

#[abi]
trait Iex02 {
    fn claim_points(my_value: u128);
    fn my_secret_value() -> u128;
}

#[abi]
trait Iex03 {
    fn get_user_counters(account: ContractAddress) -> u128;
    fn increment_counter();
    fn decrement_counter();
    fn reset_counter();
    fn claim_points();
}

#[abi]
trait Iex04 {
    fn get_user_slots(account: ContractAddress) -> u128;
    fn get_values_mapped(slot: u128) -> u128;
    fn claim_points(expected_value: u128);
    fn assign_user_slot();
}

#[abi]
trait Iex05 {
    fn get_user_values(account: ContractAddress) -> u128;
    fn claim_points(expected_value: u128);
    fn assign_user_slot();
    fn copy_secret_value_to_readable_mapping();
}

#[abi]
trait Iex06 {
    fn get_user_values(account: ContractAddress) -> u128;
    fn claim_points(expected_value: u128);
    fn assign_user_slot();
    fn external_handler_for_internal_function(a_value: u128);
}

#[abi]
trait Iex07 {
    fn claim_points(value_a: u128, value_b: u128);
}

#[abi]
trait Iex08 {
    fn set_user_values(account: ContractAddress, values: Array::<u128>);
    fn claim_points();
}

#[abi]
trait Iex09 {
    fn claim_points(array: Array::<u128>);
}

#[abi]
trait Iex10 {
    fn get_ex10b_address() -> ContractAddress;
    fn claim_points(secret_value_i_guess: u128, next_secret_value_i_chose: u128);
}

#[abi]
trait Iex10b {
    fn get_secret_value() -> u128;
    fn claim_points(secret_value_i_guess: u128, next_secret_value_i_chose: u128);
}

#[abi]
trait Iex11 {
    fn secret_value() -> u128;
    fn claim_points(secret_value_i_guess: u128, next_secret_value_i_chose: u128);
}

// #[abi]
// trait Iex12 {
//    fn assign_user_slot();
//    fn claim_points(expected_value: u128);
//}

// #[abi]
// trait Iex13 {
// }

#[abi]
trait Iex14 {
    fn claim_points();
}

#[contract]
mod ValidateCairo101 {
    ////////////////////////////////
    // Core Library imports
    // These are syscalls and functionalities that allow you to write Starknet contracts
    ////////////////////////////////
    use starknet::get_caller_address;
    use starknet::get_contract_address;
    use starknet::ContractAddress;
    use array::ArrayTrait;
    
    ////////////////////////////////
    // Internal imports
    // These functions become part of the set of functions of the contract
    ////////////////////////////////
    use super::Iex01Dispatcher;
    use super::Iex01DispatcherTrait;
    use super::Iex02Dispatcher;
    use super::Iex02DispatcherTrait;
    use super::Iex03Dispatcher;
    use super::Iex03DispatcherTrait;
    use super::Iex04Dispatcher;
    use super::Iex04DispatcherTrait;
    use super::Iex05Dispatcher;
    use super::Iex05DispatcherTrait;
    use super::Iex06Dispatcher;
    use super::Iex06DispatcherTrait;
    use super::Iex07Dispatcher;
    use super::Iex07DispatcherTrait;
    use super::Iex08Dispatcher;
    use super::Iex08DispatcherTrait;
    use super::Iex09Dispatcher;
    use super::Iex09DispatcherTrait;
    use super::Iex10Dispatcher;
    use super::Iex10DispatcherTrait;
    use super::Iex10bDispatcher;
    use super::Iex10bDispatcherTrait;
    use super::Iex11Dispatcher;
    use super::Iex11DispatcherTrait;
    // use super::Iex12Dispatcher;
    // use super::Iex12DispatcherTrait;
    // use super::Iex13Dispatcher;
    // use super::Iex13DispatcherTrait;
    use super::Iex14Dispatcher;
    use super::Iex14DispatcherTrait;

    struct Storage {
        ex01_address: ContractAddress,
        ex02_address: ContractAddress,
        ex03_address: ContractAddress,
        ex04_address: ContractAddress,
        ex05_address: ContractAddress,
        ex06_address: ContractAddress,
        ex07_address: ContractAddress,
        ex08_address: ContractAddress,
        ex09_address: ContractAddress,
        ex10_address: ContractAddress,
        ex11_address: ContractAddress,
        // ex12_address: ContractAddress,
        // ex13_address: ContractAddress,
        ex14_address: ContractAddress,
    }

    #[constructor]
    fn constructor() {
        ex01_address::write(starknet::contract_address_const::<0x031d1866cb827c4e27bbca9ffee59fa2158b679413ffb58c3f90af56e1140e85>());
        ex02_address::write(starknet::contract_address_const::<0x0600f8fe0752e598b4e6b27839f00ad65215d129f385e12931323c487b6f9b36>());
        ex03_address::write(starknet::contract_address_const::<0x033d5fc40c0e262612528a9a652ada70be854d98241fb7548745262b5273c9d1>());
        ex04_address::write(starknet::contract_address_const::<0x06967cd33c6e064087123958e239c98f0de5e6d663660fa16a2526e8b115688a>());
        ex05_address::write(starknet::contract_address_const::<0x076c32e000f7112724bba3c5f51fb1290217a1010ae555e6ecbdb2bfe6613e33>());
        ex06_address::write(starknet::contract_address_const::<0x060987aea322cd12657588b6cdb0892db79322ab4533f7d74838ff2e2614a015>());
        ex07_address::write(starknet::contract_address_const::<0x006051096480f375894eebb99948bce14a84c25093636c4b4e8222cc32a67cf0>());
        ex08_address::write(starknet::contract_address_const::<0x01ec8e981b1b6a7256a71f21790dd07cafeb15d02c18534a2bd4a6c8551860aa>());
        ex09_address::write(starknet::contract_address_const::<0x053b96c4ee027c53ea001479f24c10b543063e3c26d037c600e5bd31f0b21e5c>());
        ex10_address::write(starknet::contract_address_const::<0x0763e89551900eba82d757a9f3862935cc7f7e47538f01ddba514f23d9a5f6e0>());
        ex11_address::write(starknet::contract_address_const::<0x029a9a484d22a6353eff0d60ea56c6ffabaaac5e4889182287ef1d261578b197>());
        // ex12_address::write(starknet::contract_address_const::<0x04a221a8e3155fb03d1708881213a2ecdb05a41cf0ae6de83ddcf8f12bb04282>());
        // ex13_address::write(starknet::contract_address_const::<0x067ed1d23c5cc3a34fb86edd4f8415250c79a374e87bcf2e6870321261ca9b0f>());
        ex14_address::write(starknet::contract_address_const::<0x031e9a701a24c1d2ecd576208087dfa52f1025072cf11e54407300f64f95ce5f>());
    }

    #[external]
    fn validate_various_exercises() {
        ex01();
        ex02();
        ex03();
        ex04();
        ex05();
        ex06();
        ex07();
        ex08();
        ex09();
        ex10();
        ex11();
    }

    fn ex01() {
        Iex01Dispatcher { contract_address: ex01_address::read() }.claim_points();
    }

    fn ex02() {
        let secret = Iex02Dispatcher { contract_address: ex02_address::read() }.my_secret_value();
        Iex02Dispatcher { contract_address: ex02_address::read() }.claim_points(secret);
    }

    fn ex03() {
        Iex03Dispatcher { contract_address: ex03_address::read() }.reset_counter();
        Iex03Dispatcher { contract_address: ex03_address::read() }.increment_counter();
        Iex03Dispatcher { contract_address: ex03_address::read() }.increment_counter();
        Iex03Dispatcher { contract_address: ex03_address::read() }.decrement_counter();
        Iex03Dispatcher { contract_address: ex03_address::read() }.claim_points();
    }

    fn ex04() {
        let contract_address = get_contract_address();
        Iex04Dispatcher { contract_address: ex04_address::read() }.assign_user_slot();
        let slot = Iex04Dispatcher { contract_address: ex04_address::read() }.get_user_slots(contract_address); // or contract_address
        let value = Iex04Dispatcher { contract_address: ex04_address::read() }.get_values_mapped(slot);
        Iex04Dispatcher { contract_address: ex04_address::read() }.claim_points(value - 32_u128);
    }

    fn ex05() {
        let contract_address = get_contract_address();
        Iex05Dispatcher { contract_address: ex05_address::read() }.assign_user_slot();
        Iex05Dispatcher { contract_address: ex05_address::read() }.copy_secret_value_to_readable_mapping();
        let value = Iex05Dispatcher { contract_address: ex05_address::read() }.get_user_values(contract_address);
        Iex05Dispatcher { contract_address: ex05_address::read() }.claim_points(value - 9_u128);
    }

    fn ex06() {
        let contract_address = get_contract_address();
        Iex06Dispatcher { contract_address: ex06_address::read() }.assign_user_slot();
        Iex06Dispatcher { contract_address: ex06_address::read() }.external_handler_for_internal_function(1_u128);
        let value = Iex06Dispatcher { contract_address: ex06_address::read() }.get_user_values(contract_address); // or contract_address
        Iex06Dispatcher { contract_address: ex06_address::read() }.claim_points(value);
    }

    fn ex07() {
        Iex07Dispatcher { contract_address: ex07_address::read() }.claim_points(40_u128, 0_u128);
    }

    fn ex08() {
        let contract_address = get_contract_address();
        let mut values = ArrayTrait::new();
        values.append(0_u128);
        values.append(1_u128);
        values.append(2_u128);
        values.append(3_u128);
        values.append(4_u128);
        values.append(5_u128);
        values.append(6_u128);
        values.append(7_u128);
        values.append(8_u128);
        values.append(9_u128);
        values.append(10_u128);
        Iex08Dispatcher { contract_address: ex08_address::read() }.set_user_values(contract_address, values);
        Iex08Dispatcher { contract_address: ex08_address::read() }.claim_points();
    }

    fn ex09() {
        let mut values = ArrayTrait::new();
        values.append(10_u128);
        values.append(10_u128);
        values.append(10_u128);
        values.append(10_u128);
        values.append(10_u128);
        Iex09Dispatcher { contract_address: ex09_address::read() }.claim_points(values);
    }

    fn ex10() {
        let ex10b_address = Iex10Dispatcher{contract_address: ex10_address::read() }.get_ex10b_address();
        let value = Iex10bDispatcher{contract_address: ex10b_address }.get_secret_value();
        let mut new_value = 0;
        if (value > 10_u128) {
            Iex10Dispatcher { contract_address: ex10_address::read() }.claim_points(value, 9_u128);
        } else { 
            Iex10Dispatcher { contract_address: ex10_address::read() }.claim_points(value, 10_u128);
        }
    }

    fn ex11() {
        let mut value = Iex11Dispatcher { contract_address: ex11_address::read() }.secret_value();
        if (value + 42069_u128 > 340282366920938463463374607431768211455_u128- 42069_u128 ) { value += 42069_u128; }
        else { value -= 42069_u128; }
        Iex11Dispatcher { contract_address: ex11_address::read() }.claim_points(value, 101_u128);
    }

    // fn ex12() {
        // Iex12Dispatcher { contract_address: ex12_address::read() }.assign_user_slot(); // We need to listen to the event here
        // let value = ???
        // Iex12Dispatcher { contract_address: ex12_address::read() }.claim_points(0_u128);

    // }

    // fn ex13() {
        
    // }

    #[external]
    fn ex14() {
        Iex14Dispatcher { contract_address: ex14_address::read() }.claim_points();
    }

}
