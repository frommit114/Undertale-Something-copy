// Feather disable all

//This script contains the default profiles, and hence the default bindings and verbs, for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The struct return by this script contains the names of each default profile.
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

function __input_config_verbs()
{
return {
    //Bind keyboard controls to verbs
    keyboard_and_mouse:
    {
        left:  input_binding_key(vk_left),
        right: input_binding_key(vk_right),
        up: input_binding_key(vk_up),
		down: input_binding_key(vk_down),
		confirm: input_binding_key("Z"),
		cancel: input_binding_key("X"),
		menu: input_binding_key("C"),
		close_game: input_binding_key(vk_escape),
		
    },
};
}