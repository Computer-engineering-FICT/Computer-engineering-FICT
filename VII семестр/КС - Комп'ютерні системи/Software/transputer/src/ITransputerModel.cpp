#include "StdAfx.h"
#include ".\itransputermodel.h"
#include "TransputerParam.h"

ITransputer::ITransputer(void)
{
}

ITransputer::~ITransputer(void)
{
}

ITransputerParam* SimpleModel::CreateTransputerParam()
{
	return new SimpleTopologyParam();
}

ITopology* SimpleModel::CreateTransputerModel(ITransputerParam* param)
{
	return new SimpleTopology(param);
}

ITransputerView* SimpleModel::CreateTransputerView(TransputerModel* model)
{
	return new SimpleTransputerView(model);
}

ITransputerParam* CircleModel::CreateTransputerParam()
{
	return new CircleTopologyParam();
}

ITopology* CircleModel::CreateTransputerModel(ITransputerParam* param)
{
	return new CircleTopology(param);
}

ITransputerView* CircleModel::CreateTransputerView(TransputerModel* model)
{
	return new CircleTransputerView(model);
}

ITransputerParam* TorModel::CreateTransputerParam()
{
	return new TorTopologyParam();
}

ITopology* TorModel::CreateTransputerModel(ITransputerParam* param)
{
	return new TorTopology(param);
}

ITransputerView* TorModel::CreateTransputerView(TransputerModel* model)
{
	return new TorTransputerView(model);
}

ITransputerParam* StarModel::CreateTransputerParam()
{
	return new StarTopologyParam();
}

ITopology* StarModel::CreateTransputerModel(ITransputerParam* param)
{
	return new StarTopology(param);
}

ITransputerView* StarModel::CreateTransputerView(TransputerModel* model)
{
	return new StarTransputerView(model);
}


ITransputer* CreateTransputerObj(TOPOLOGY_TYPE type)
{
	switch(type)
	{
	case SIMPLE_TOPOLOGY: return new SimpleModel();
	case CIRCLE_TOPOLOGY: return new CircleModel();
	case TOR_TOPOLOGY: return new TorModel();
	case STAR_TOPOLOGY: return new StarModel();
	}
	return NULL;
}

void GetTopologies(std::vector<int>& ids,std::vector<std::string>& names)
{
	ids.push_back(SIMPLE_TOPOLOGY);
	names.push_back("Simple topology");

	ids.push_back(CIRCLE_TOPOLOGY);
	names.push_back("Ring topology");

	ids.push_back(TOR_TOPOLOGY);
	names.push_back("Torus topology");

	ids.push_back(STAR_TOPOLOGY);
	names.push_back("Any to any topology");
}