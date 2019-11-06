VM_NAME = pxe

.PHONY: console install start stop undefine

download:
	@./download

clean:
	@./download --clean

console:
	@sudo virsh console ${VM_NAME}

install:
	@sudo virt-install --pxe --network network=default --name ${VM_NAME} --memory 2048 --disk size=10 --nographics --boot menu=on,useserial=on

start:
	@sudo virsh start ${VM_NAME}

stop:
	@sudo virsh destroy ${VM_NAME}

undefine:
	@sudo virsh undefine ${VM_NAME}
