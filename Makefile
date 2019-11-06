VM_NAME = pxe

.PHONY: help download console clean install start stop undefine

help:
	@echo "Targets:"
	@echo "- download: download images"
	@echo "- install: install coreos system"
	@echo "- start: start the vm"
	@echo "- stop: stop the vm"
	@echo "- undefine: undefine the vm"
	@echo "- console: login to the vm console"
	@echo "- clean: clean the downloaded images"

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
