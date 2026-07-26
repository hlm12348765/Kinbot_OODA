package KinbotProcessOperandMapping {

    private import StandardViewDefinitions::*;

    view def <porv> '过程—操作数关系视图' specializes GeneralView {
        doc /*
         * 每个 item definition 和 action definition 在图中只显示一次。
         * 连线由 action definition 所拥有参数的方向和类型派生：
         * in 参数从 item definition 指向 action definition；
         * out 参数从 action definition 指向 item definition。
         * 这些连线不是 flow connection，也不定义过程顺序。
         * I1/I2 表示持续产生的信息流，I3 表示持续更新的带版本状态。
         * P-P2～P-P7 直接读取经过登记的 I1 实时传感数据，用于确定性控制、
         * 限制、中止和保护；需要解释和长期维护的内容仍经 I-P1/I-P2 形成 I2/I3。
         */
    }

    package Operands {
        item def <I1> '输入数据与消息';
        item def <I2> '观察与事件';
        item def <I3> '状态与上下文';
        item def <I4> '目标与行动方案';
        item def <I5> '安全与授权决定';
        item def <I6> '技能与工具调用状态';
        item def <I7> '结果与证据';
        item def <I8> '运行资源与版本状态';

        item def <P1> '传感器可检测的物理信号';
        item def <P2> '能量与热状态';
        item def <P3> '机器人自身物理状态与输出';
        item def <P4> '机器人携带物品的状态';
        item def <P5> '外部世界物理状态';
        item def <P6> '可安全操控的外部物体状态' :> P5;
    }

    package '信息空间过程' {
        private import KinbotProcessOperandMapping::Operands::*;

        action def <'I-P1'> '处理输入并形成观察与事件' {
            in inputDataAndMessageStream : I1;
            out observationAndEventStream : I2;
        }

        action def <'I-P2'> 'Orient：理解、融合并维护状态' {
            in newObservationAndEvent : I2;
            in resultAndEvidence : I7;
            in previousStateAndContext : I3;
            out updatedStateAndContext : I3;
        }

        action def <'I-P3'> '形成目标与行动方案' {
            in observationAndEvent : I2;
            in stateAndContext : I3;
            out goalAndActionPlan : I4;
        }

        action def <'I-P4'> '评估风险并授权行动' {
            in stateAndContext : I3;
            in goalAndActionPlan : I4;
            out safetyAndAuthorizationDecision : I5;
        }

        action def <'I-P5'> '分派任务并调用技能或工具' {
            in goalAndActionPlan : I4;
            in safetyAndAuthorizationDecision : I5;
            in runtimeResourceAndVersionState : I8;
            out skillAndToolInvocationState : I6;
        }

        action def <'I-P6'> '执行信息操作' {
            in stateAndContext : I3;
            in safetyAndAuthorizationDecision : I5;
            in skillAndToolInvocationState : I6;
            out resultAndEvidence : I7;
        }

        action def <'I-P7'> '验证结果并决定后续处理' {
            in observationAndEvent : I2;
            in goalAndActionPlan : I4;
            in skillAndToolInvocationState : I6;
            in currentResult : I7;
            out verifiedResultAndEvidence : I7;
        }

        action def <'I-P8'> '管理运行资源与更新' {
            in resourceAndUpdateEvent : I2;
            in resourceDemand : I6;
            in currentRuntimeResourceAndVersionState : I8;
            out updatedRuntimeResourceAndVersionState : I8;
        }
    }

    package '物理空间过程' {
        private import KinbotProcessOperandMapping::Operands::*;

        action def <'P-P1'> '采集物理信号并生成传感数据' {
            in sensorDetectablePhysicalSignalStream : P1;
            out physicalSensorDataStream : I1;
        }

        action def <'P-P2'> '管理能量与热状态' {
            in realtimeSensorData : I1;
            in energyAndThermalState : P2;
            in runtimeResourceAndVersionState : I8;
            out controlledEnergyAndThermalState : P2;
        }

        action def <'P-P3'> '改变机器人自身状态与输出' {
            in realtimeSensorData : I1;
            in safetyAndAuthorizationDecision : I5;
            in skillAndToolInvocationState : I6;
            in energyAndThermalState : P2;
            in currentRobotPhysicalStateAndOutput : P3;
            out updatedRobotPhysicalStateAndOutput : P3;
            out updatedPhysicalFeedback : P1;
        }

        action def <'P-P4'> '运送用户放入的物品' {
            in realtimeSensorData : I1;
            in safetyAndAuthorizationDecision : I5;
            in skillAndToolInvocationState : I6;
            in energyAndThermalState : P2;
            in robotPhysicalStateAndOutput : P3;
            in carriedItemState : P4;
            out updatedRobotPhysicalStateAndOutput : P3;
            out updatedCarriedItemState : P4;
            out updatedPhysicalFeedback : P1;
        }

        action def <'P-P5'> '限制或停止机器人的危险动作' {
            in realtimeSensorData : I1;
            in energyAndThermalState : P2;
            in currentRobotPhysicalStateAndOutput : P3;
            out limitedEnergyAndThermalState : P2;
            out limitedRobotPhysicalStateAndOutput : P3;
            out updatedPhysicalFeedback : P1;
        }

        action def <'P-P6'> '安全操控外部物体（机械臂预留）' {
            in realtimeSensorData : I1;
            in safetyAndAuthorizationDecision : I5;
            in skillAndToolInvocationState : I6;
            in energyAndThermalState : P2;
            in robotPhysicalStateAndOutput : P3;
            in manipulableExternalObjectState : P6;
            out updatedRobotPhysicalStateAndOutput : P3;
            out updatedManipulableExternalObjectState : P6;
            out updatedPhysicalFeedback : P1;
        }

        action def <'P-P7'> '紧急情况下强制改变外部状态' {
            in realtimeSensorData : I1;
            in emergencyAuthorizationDecision : I5;
            in emergencySkillInvocationState : I6;
            in energyAndThermalState : P2;
            in robotPhysicalStateAndOutput : P3;
            in externalWorldPhysicalState : P5;
            out updatedRobotPhysicalStateAndOutput : P3;
            out updatedExternalWorldPhysicalState : P5;
            out updatedPhysicalFeedback : P1;
        }
    }
}
