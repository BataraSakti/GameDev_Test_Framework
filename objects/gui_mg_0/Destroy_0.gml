///@description clean-up


sprite_delete(backer);
sprite_delete(shelf);
sprite_delete(tut1);
sprite_delete(tut2);

ds_list_clear(eval_game1_numbers);
ds_list_clear(eval_game1_letters);
ds_list_clear(eval_game1_words);

ds_list_destroy_safe(round_data_list);
ds_list_destroy_safe(randomed_index1);
ds_list_destroy_safe(randomed_index2);
	