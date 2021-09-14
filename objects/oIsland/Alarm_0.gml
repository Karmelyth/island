/// @description CARVER GENERATION

if carver_queue > -4{
	
	repeat(ds_queue_size(carver_queue)){

		island_create_carver(self, ds_queue_dequeue(carver_queue));
	}
	
	ds_queue_destroy(carver_queue);
}