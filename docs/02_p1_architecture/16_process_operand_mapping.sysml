package KinbotProcessOperandMapping {

    private import StandardViewDefinitions::*;

    view def <porv> '过程—操作数关系视图' specializes GeneralView {
        doc /*
         * 每个 item definition 和 action definition 在图中只显示一次。
         * 连线由 action definition 所拥有参数的方向和类型派生：
         * in 参数从 item definition 指向 action definition；
         * out 参数从 action definition 指向 item definition。
         * 这些连线不是 flow connection，也不定义过程顺序。
         */
    }

    package Operands {
        item def <I1> '输入与约束';
        item def <I2> '观察与事件';
        item def <I3> '状态与上下文';
        item def <I4> '目标与行动方案';
        item def <I5> '安全与授权决定';
        item def <I6> '能力调用与执行状态';
        item def <I7> '结果与信息输出';
        item def <I8> '运行资源与版本状态';

        item def <P1> '可感知物理现象';
        item def <P2> '能量与热状态';
        item def <P3> '机器人行为与作用';
        item def <P4> '物质与载荷';
        item def <P5> '物理状态变化与反馈';
    }

    package '信息空间过程' {
        private import KinbotProcessOperandMapping::Operands::*;

        action def <'I-P1'> '形成并校验观察' {
            in sensorMessageEventInput : I1;
            out observationAndEvent : I2;
        }

        action def <'I-P2'> 'Orient：理解、融合并维护状态' {
            in inputAndConstraints : I1;
            in observationAndEvent : I2;
            in resultAndInformationOutput : I7;
            in previousStateAndContext : I3;
            out updatedStateAndContext : I3;
        }

        action def <'I-P3'> '形成目标与行动方案' {
            in inputAndConstraints : I1;
            in stateAndContext : I3;
            out goalAndActionPlan : I4;
        }

        action def <'I-P4'> '评估风险并授权行动' {
            in inputAndConstraints : I1;
            in stateAndContext : I3;
            in goalAndActionPlan : I4;
            out safetyAndAuthorizationDecision : I5;
        }

        action def <'I-P5'> '分派目标并组织能力调用' {
            in goalAndActionPlan : I4;
            in safetyAndAuthorizationDecision : I5;
            in runtimeResourceAndVersionState : I8;
            out capabilityCallAndExecutionState : I6;
        }

        action def <'I-P6'> '执行信息能力' {
            in stateAndContext : I3;
            in safetyAndAuthorizationDecision : I5;
            in capabilityCallAndExecutionState : I6;
            out resultAndInformationOutput : I7;
        }

        action def <'I-P7'> '验证结果并维持连续性' {
            in observationAndEvent : I2;
            in capabilityCallAndExecutionState : I6;
            in currentResult : I7;
            out resultAndStateDelta : I7;
        }

        action def <'I-P8'> '管理运行资源与更新' {
            in resourcePolicy : I1;
            in resourceDemand : I6;
            in currentRuntimeResourceAndVersionState : I8;
            out updatedRuntimeResourceAndVersionState : I8;
        }
    }

    package '物理空间过程' {
        private import KinbotProcessOperandMapping::Operands::*;

        action def <'P-P1'> '感受并转换物理现象' {
            in perceivablePhysicalPhenomena : P1;
            in physicalStateAndFeedback : P5;
            out physicalSensorEnvelope : I1;
        }

        action def <'P-P2'> '接收、转换并分配能量' {
            in energyAndThermalState : P2;
            in runtimeResourceAndVersionState : I8;
            out controlledEnergyAndThermalState : P2;
        }

        action def <'P-P3'> '执行机器人行为' {
            in safetyAndAuthorizationDecision : I5;
            in capabilityCallAndExecutionState : I6;
            in energyAndThermalState : P2;
            out robotBehaviorAndEffect : P3;
            out physicalStateAndFeedback : P5;
        }

        action def <'P-P4'> '容纳、运输并交接载荷' {
            in safetyAndAuthorizationDecision : I5;
            in capabilityCallAndExecutionState : I6;
            in robotBehaviorAndEffect : P3;
            in matterAndPayload : P4;
            out updatedMatterAndPayload : P4;
            out physicalStateAndFeedback : P5;
        }

        action def <'P-P5'> '限制、中止并锁定危险行为' {
            in safetySensorSignal : P1;
            in energyAndThermalState : P2;
            in currentRobotBehavior : P3;
            in currentPhysicalState : P5;
            out limitedRobotBehavior : P3;
            out safePhysicalState : P5;
            out safetyEvidence : I7;
        }
    }
}
